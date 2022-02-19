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
        setDOMHandlerIfNeeded("ontransitionend", createOrUpdate(TransitionEndContainer.self) {
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
        onTransitionEnd { _,_ in handler(self) }
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
