//
//  State.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 16.11.2020.
//

public typealias WState = State

public protocol StateConvertible: UniValue {
    associatedtype Value
    
    var stateValue: State<Value> { get }
}

extension StateConvertible {
    public var uniValue: Value { stateValue.wrappedValue }
    public var uniStateValue: State<Value>? { stateValue }
}

@propertyWrapper
open class State<Value>: Stateable {
    private var _originalValue: Value
    private var _wrappedValue: Value
    public var wrappedValue: Value {
        get { _wrappedValue }
        set {
            let oldValue = _wrappedValue
            _wrappedValue = newValue
            for trigger in beginTriggers {
                trigger()
            }
            for listener in listeners {
                listener(oldValue, newValue)
            }
            for trigger in endTriggers {
                trigger()
            }
        }
    }
    
    public var projectedValue: State<Value> { self }

    init (_ stateA: AnyState, _ stateB: AnyState, _ expression: @escaping () -> Value) {
        let value = expression()
        _originalValue = value
        _wrappedValue = value
        stateA.listen {
            self.wrappedValue = expression()
        }
        stateB.listen {
            self.wrappedValue = expression()
        }
    }
    
    init <A, B>(_ stateA: State<A>, _ stateB: State<B>, _ expression: @escaping (A, B) -> Value) {
        let value = expression(stateA.wrappedValue, stateB.wrappedValue)
        _originalValue = value
        _wrappedValue = value
        stateA.listen {
            self.wrappedValue = expression(stateA.wrappedValue, stateB.wrappedValue)
        }
        stateB.listen {
            self.wrappedValue = expression(stateA.wrappedValue, stateB.wrappedValue)
        }
    }
    
    init <A, B>(_ stateA: State<A>, _ stateB: State<B>, _ expression: @escaping (CombinedDeprecatedResult<A, B>) -> Value) {
        let value = expression(.init(left: stateA.wrappedValue, right: stateB.wrappedValue))
        _originalValue = value
        _wrappedValue = value
        stateA.listen {
            self.wrappedValue = expression(.init(left: stateA.wrappedValue, right: stateB.wrappedValue))
        }
        stateB.listen {
            self.wrappedValue = expression(.init(left: stateA.wrappedValue, right: stateB.wrappedValue))
        }
    }
    
    public init(wrappedValue value: Value) {
        _originalValue = value
        _wrappedValue = value
    }
    
    init (_ stateA: AnyState, _ expression: @escaping () -> Value) {
        let value = expression()
        _originalValue = value
        _wrappedValue = value
        stateA.listen {
            self.wrappedValue = expression()
        }
    }
    
    init <A>(_ stateA: State<A>, _ expression: @escaping (A) -> Value) {
        let value = expression(stateA.wrappedValue)
        _originalValue = value
        _wrappedValue = value
        stateA.listen {
            self.wrappedValue = expression(stateA.wrappedValue)
        }
    }
    
    public func reset() {
        let oldValue = _wrappedValue
        _wrappedValue = _originalValue
        for trigger in beginTriggers {
            trigger()
        }
        for listener in listeners {
            listener(oldValue, _wrappedValue)
        }
        for trigger in endTriggers {
            trigger()
        }
    }
    
    public func removeAllListeners() {
        beginTriggers.removeAll()
        endTriggers.removeAll()
        listeners.removeAll()
    }
    
    public typealias Trigger = () -> Void
    public typealias Listener = (_ old: Value, _ new: Value) -> Void
    public typealias SimpleListener = (_ value: Value) -> Void
    
    private var beginTriggers: [Trigger] = []
    private var endTriggers: [Trigger] = []
    fileprivate var listeners: [Listener] = []
    
    public func manualChangeNotify() {
        beginTriggers.forEach { $0() }
        listeners.forEach {
            $0(_wrappedValue, _wrappedValue)
        }
        endTriggers.forEach { $0() }
    }
    
    public func beginTrigger(_ trigger: @escaping Trigger) {
        beginTriggers.append(trigger)
    }
    
    public func endTrigger(_ trigger: @escaping Trigger) {
        endTriggers.append(trigger)
    }
    
    public func listen(_ listener: @escaping Listener) {
        listeners.append(listener)
    }
    
    public func listen(_ listener: @escaping SimpleListener) {
        listeners.append({ _, new in listener(new) })
    }
    
    public func listen(_ listener: @escaping () -> Void) {
        listeners.append({ _,_ in listener() })
    }
    
    public func merge(with state: State<Value>, leftChanged: ((Value) -> Void)? = nil, rightChanged: ((Value) -> Void)? = nil) {
        self.wrappedValue = state.wrappedValue
        var justSetExternal = false
        var justSetInternal = false
        state.listen { new in
            guard !justSetInternal else { return }
            justSetExternal = true
            self.wrappedValue = new
            rightChanged?(new)
            justSetExternal = false
        }
        self.listen { new in
            guard !justSetExternal else { return }
            justSetInternal = true
            state.wrappedValue = new
            leftChanged?(new)
            justSetInternal = false
        }
    }
    
    public func and<V>(_ state: State<V>) -> CombinedState<Value, V> {
        CombinedState(left: projectedValue, right: state)
    }
}

extension State: StateConvertible {
    public var stateValue: State<Value> { self }
}

extension State: InnerStateChangeableObserver where Value: InnerStateChangeable {
    public func innerStateChangeableSetup() {
        _wrappedValue.innerStateChanged = { old, new in
            self.beginTriggers.forEach { $0() }
            self.listeners.forEach { $0(old, new) }
            self.endTriggers.forEach { $0() }
        }
    }
}

extension State where Value: Equatable {
    public func listenOnlyIfChanged(_ listener: @escaping SimpleListener) {
        listen { old, new in
            guard old != new else { return }
            listener(new)
        }
    }
}

public class CombinedState<A, B> {
    let _left: State<A>
    let _right: State<B>
    public var left: A { _left.wrappedValue }
    public var right: B { _right.wrappedValue }
    
    init (left: State<A>, right: State<B>) {
        self._left = left
        self._right = right
    }
    
    public func map<Result>(_ expression: @escaping () -> Result) -> State<Result> {
        .init(_left, _right, expression)
    }
    
    public func map<Result>(_ expression: @escaping (A, B) -> Result) -> State<Result> {
        .init(_left, _right, expression)
    }
    
    @available(*, deprecated, message: "🧨 This method will be removed soon. Please switch to `.map { left, right in }`.")
    public func map<Result>(_ expression: @escaping (CombinedDeprecatedResult<A, B>) -> Result) -> State<Result> {
        .init(_left, _right, expression)
    }
    
    public func listen(_ listener: @escaping (_ left: A, _ right: B) -> Void) {
        _left.listeners.append({ _, new in listener(new, self._right.wrappedValue) })
        _right.listeners.append({ _, new in listener(self._left.wrappedValue, new) })
    }
    
    public func listen(_ listener: @escaping () -> Void) {
        _left.listeners.append({ _,_ in listener() })
        _right.listeners.append({ _,_ in listener() })
    }
}

public struct CombinedDeprecatedResult<A, B> {
    public let left: A
    public let right: B
}








/// Universal value, could be simple value or State value
public protocol UniValue {
    associatedtype UniValue
    
    var uniValue: UniValue { get }
    var uniStateValue: State<UniValue>? { get }
}

extension String: UniValue {
    public var uniValue: String { self }
    public var uniStateValue: State<String>? { nil }
}

extension Int: UniValue {
    public typealias UniValue = Int
    
    public var uniValue: Int { self }
    public var uniStateValue: State<Int>? { nil }
}

extension Double: UniValue {
    public typealias UniValue = Double
    
    public var uniValue: UniValue { self }
    public var uniStateValue: State<UniValue>? { nil }
}

extension Bool: UniValue {
    public typealias UniValue = Bool
    
    public var uniValue: UniValue { self }
    public var uniStateValue: State<UniValue>? { nil }
}
