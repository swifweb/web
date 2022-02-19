//
//  TouchMoveHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol TouchMoveHandleable: DOMEventable {
    @discardableResult
    func onTouchMove(_ handler: @escaping () -> Void) -> Self
}

fileprivate class TouchMoveContainer: Container<TouchEvent>, StorageKey {
    typealias Value = TouchMoveContainer
}

extension TouchMoveHandleable {
    /// The touchmove event occurs when the user moves the finger across the screen.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchmove.asp)
    @discardableResult
    public func onTouchMove(_ handler: @escaping (Self, TouchEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ontouchmove", createOrUpdate(TouchMoveContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The touchmove event occurs when the user moves the finger across the screen.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchmove.asp)
    @discardableResult
    public func onTouchMove(_ handler: @escaping (Self) -> Void) -> Self {
        onTouchMove { _,_ in handler(self) }
    }
    
    /// The touchmove event occurs when the user moves the finger across the screen.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchmove.asp)
    @discardableResult
    public func onTouchMove(_ handler: @escaping () -> Void) -> Self {
        onTouchMove { _ in handler() }
    }
}
