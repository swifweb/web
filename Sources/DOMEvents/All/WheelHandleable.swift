//
//  WheelHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol WheelHandleable: DOMEventable {
    @discardableResult
    func onWheel(_ handler: @escaping () -> Void) -> Self
}

fileprivate final class WheelContainer: Container<WheelEvent>, StorageKey {
    typealias Value = WheelContainer
}

extension WheelHandleable {
    /// The onwheel event occurs when the mouse wheel is rolled up or down over an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onwheel.asp)
    @discardableResult
    public func onWheel(_ handler: @escaping (WheelEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onwheel", createOrUpdate(WheelContainer.self, handler))
    }
    
    @discardableResult
    public func onWheel(_ handler: @escaping () -> Void) -> Self {
        onWheel { _ in handler() }
    }
}
