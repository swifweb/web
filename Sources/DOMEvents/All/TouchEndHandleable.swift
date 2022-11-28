//
//  TouchEndHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol TouchEndHandleable: DOMEventable {
    @discardableResult
    func onTouchEnd(_ handler: @escaping () -> Void) -> Self
}

fileprivate class TouchEndContainer: Container<TouchEvent>, StorageKey {
    typealias Value = TouchEndContainer
}

extension TouchEndHandleable {
    /// The `ontouchend` event occurs when the user removes the finger from an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchend.asp)
    @discardableResult
    public func onTouchEnd(_ handler: @escaping (Self, TouchEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ontouchend", createOrUpdate(TouchEndContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The `ontouchend` event occurs when the user removes the finger from an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchend.asp)
    @discardableResult
    public func onTouchEnd(_ handler: @escaping (Self) -> Void) -> Self {
        onTouchEnd { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The `ontouchend` event occurs when the user removes the finger from an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchend.asp)
    @discardableResult
    public func onTouchEnd(_ handler: @escaping () -> Void) -> Self {
        onTouchEnd { _ in handler() }
    }
}
