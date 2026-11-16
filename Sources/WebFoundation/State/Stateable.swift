public protocol Stateable: AnyState {
    associatedtype Value
    var wrappedValue: Value { get set }

    @discardableResult
    func beginTrigger(_ trigger: @escaping () -> Void) -> StateListener
    @discardableResult
    func endTrigger(_ trigger: @escaping () -> Void) -> StateListener
    @discardableResult
    func listen(_ listener: @escaping (_ old: Value, _ new: Value) -> Void) -> StateListener
    @discardableResult
    func listen(_ listener: @escaping (_ value: Value) -> Void) -> StateListener
    @discardableResult
    func listen(_ listener: @escaping () -> Void) -> StateListener
}

public extension Stateable where Value: Equatable {
    @discardableResult
    func listenDistinct(_ listener: @escaping (_ old: Value, _ new: Value) -> Void) -> StateListener {
        listen { oldValue, newValue in
            guard oldValue != newValue else { return }
            listener(oldValue, newValue)
        }
    }

    @discardableResult
    func listenDistinct(_ listener: @escaping (_ value: Value) -> Void) -> StateListener {
        listenDistinct { _, newValue in listener(newValue) }
    }
}
