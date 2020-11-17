//
//  State.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

public typealias UState = State

@propertyWrapper
open class State<Value>: Stateable {
    private var _originalValue: Value
    private var _wrappedValue: Value
    public var wrappedValue: Value {
        get { _wrappedValue }
        set {
            let oldValue = _wrappedValue
            _wrappedValue = newValue
            beginTriggers.forEach { $0() }
            listeners.forEach { $0(oldValue, newValue) }
            endTriggers.forEach { $0() }
        }
    }
    
    public var projectedValue: State<Value> { self }

    public init(wrappedValue value: Value) {
        _originalValue = value
        _wrappedValue = value
        (self as? StateChangeableObserver)?.setupStateChangeable()
    }
    
    public func reset() {
        let oldValue = _wrappedValue
        _wrappedValue = _originalValue
        beginTriggers.forEach { $0() }
        listeners.forEach { $0(oldValue, _wrappedValue) }
        endTriggers.forEach { $0() }
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
    private var listeners: [Listener] = []
    
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
    
    public func merge(with state: State<Value>) {
        self.wrappedValue = state.wrappedValue
        var justSetExternal = false
        var justSetInternal = false
        state.listen { new in
            guard !justSetInternal else { return }
            justSetExternal = true
            self.wrappedValue = new
            justSetExternal = false
        }
        self.listen { new in
            guard !justSetExternal else { return }
            justSetInternal = true
            state.wrappedValue = new
            justSetInternal = false
        }
    }
    
    // MARK: Experimental part
    
    public struct CombinedStateResult<A, B> {
        public let left: A
        public let right: B
    }
    
    /// Merging two states into one combined state which could be used as expressable state
    public func and<V>(_ state: State<V>) -> State<CombinedStateResult<Value, V>> {
        let stateA = self
        let stateB = state
        let combinedValue = {
            return CombinedStateResult(left: stateA.wrappedValue, right: stateB.wrappedValue)
        }
        let resultState = State<CombinedStateResult<Value, V>>(wrappedValue: combinedValue())
        stateA.listen {
            resultState.wrappedValue = combinedValue()
        }
        stateB.listen {
            resultState.wrappedValue = combinedValue()
        }
        return resultState
    }
}

extension State: StateChangeableObserver where Value: StateChangeable {
    func setupStateChangeable() {
        _wrappedValue.changed = { old, new in
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
