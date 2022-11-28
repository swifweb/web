//
//  TransitionEndHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol TransitionEndHandleable: DOMEventable {
    @discardableResult
    func onTransitionEnd(_ handler: @escaping () -> Void) -> Self
}

fileprivate class TransitionEndContainer: Container<TransitionEvent>, StorageKey {
    typealias Value = TransitionEndContainer
}

extension TransitionEndHandleable {
    /// The transitionend event occurs when a CSS transition has completed.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_transitionend.asp)
    @discardableResult
    public func onTransitionEnd(_ handler: @escaping (Self, TransitionEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ontransitionend", createOrUpdate(TransitionEndContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The transitionend event occurs when a CSS transition has completed.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_transitionend.asp)
    @discardableResult
    public func onTransitionEnd(_ handler: @escaping (Self) -> Void) -> Self {
        onTransitionEnd { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The transitionend event occurs when a CSS transition has completed.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_transitionend.asp)
    @discardableResult
    public func onTransitionEnd(_ handler: @escaping () -> Void) -> Self {
        onTransitionEnd { _ in handler() }
    }
}
