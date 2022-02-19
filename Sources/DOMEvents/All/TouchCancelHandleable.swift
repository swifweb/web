//
//  TouchCancelHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol TouchCancelHandleable: DOMEventable {
    @discardableResult
    func onTouchCancel(_ handler: @escaping () -> Void) -> Self
}

fileprivate class TouchCancelContainer: Container<TouchEvent>, StorageKey {
    typealias Value = TouchCancelContainer
}

extension TouchCancelHandleable {
    /// The `ontouchcancel` event occurs when the touch event gets interrupted.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchcancel.asp)
    @discardableResult
    public func onTouchCancel(_ handler: @escaping (Self, TouchEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ontouchcancel", createOrUpdate(TouchCancelContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The `ontouchcancel` event occurs when the touch event gets interrupted.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchcancel.asp)
    @discardableResult
    public func onTouchCancel(_ handler: @escaping (Self) -> Void) -> Self {
        onTouchCancel { _,_ in handler(self) }
    }
    
    /// The `ontouchcancel` event occurs when the touch event gets interrupted.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchcancel.asp)
    @discardableResult
    public func onTouchCancel(_ handler: @escaping () -> Void) -> Self {
        onTouchCancel { _ in handler() }
    }
}
