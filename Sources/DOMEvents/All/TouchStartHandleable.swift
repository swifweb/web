//
//  TouchStartHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol TouchStartHandleable: DOMEventable {
    @discardableResult
    func onTouchStart(_ handler: @escaping () -> Void) -> Self
}

fileprivate class TouchStartContainer: Container<TouchEvent>, StorageKey {
    typealias Value = TouchStartContainer
}

extension TouchStartHandleable {
    /// The touchstart event occurs when the user touches an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchstart.asp)
    @discardableResult
    public func onTouchStart(_ handler: @escaping (TouchEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ontouchstart", createOrUpdate(TouchStartContainer.self, handler))
    }
    
    @discardableResult
    public func onTouchStart(_ handler: @escaping () -> Void) -> Self {
        onTouchStart { _ in handler() }
    }
}
