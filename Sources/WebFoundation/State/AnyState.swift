//
//  AnyState.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 16.11.2020.
//

extension State {
    public func map<Result>(_ expression: @escaping () -> Result) -> State<Result> {
        .init(self, expression)
    }
    
    public func map<Result>(_ expression: @escaping (Value) -> Result) -> State<Result> {
        .init(self, expression)
    }
}

// MARK: Any States to Expressable

@MainActor public protocol AnyState: AnyObject {
    func listen(_ listener: @escaping () -> Void)
}

@MainActor public class AnyStates {
    private var _expression: (() -> Void)?
    
    @discardableResult
    init (_ states: [AnyState], expression: @escaping () -> Void) {
        _expression = expression
        for state in states {
            state.listen { [weak self] in
                self?._expression?()
            }
        }
    }
}

extension Array where Element == AnyState {
    @MainActor public func map<Result>(_ expression: @escaping () -> Result) -> State<Result> {
        let state = State<Result>.init(wrappedValue: expression())
        AnyStates(self) { [weak state] in
            state?.wrappedValue = expression()
        }
        return state
    }
}
