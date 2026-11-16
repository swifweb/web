import FoundationEssentials

extension State {
    public func map<Result>(_ expression: @escaping () -> Result) -> State<Result> {
        .init(self, expression)
    }

    public func map<Result>(_ expression: @escaping (Value) -> Result) -> State<Result> {
        .init(self, expression)
    }

    public func map<Result>(
        expressionTo: @escaping (Value) -> Result,
        expressionFrom: @escaping (Result) -> Value
    ) -> State<Result> {
        .init(self, expressionTo, expressionFrom)
    }
}

public protocol AnyState: AnyObject {
    var id: UUID { get }
    @discardableResult
    func listen(_ listener: @escaping () -> Void) -> StateListener
    func removeListener(id: UUID)
    func removeListeners()
}

public class AnyStates {
    private var expression: (() -> Void)?

    @discardableResult
    init(_ states: [AnyState], expression: @escaping () -> Void) {
        self.expression = expression
        for state in states {
            state.listen { [weak self] in self?.expression?() }
        }
    }
}

extension Array where Element == AnyState {
    public func map<Result>(_ expression: @escaping () -> Result) -> State<Result> {
        let state = State<Result>(wrappedValue: expression())
        for source in self {
            source.listen { [weak state] in
                state?.wrappedValue = expression()
            }.hold(in: state)
        }
        return state
    }
}
