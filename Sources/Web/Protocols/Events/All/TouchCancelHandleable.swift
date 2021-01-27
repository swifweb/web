//
//  TouchCancelHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol TouchCancelHandleable {
    @discardableResult
    func onTouchCancel(_ handler: @escaping () -> Void) -> Self
}

protocol _TouchCancelHandleable: _AnyElement, TouchCancelHandleable {
    typealias TouchCancelClosure = JSClosure
    
    var touchCancelClosure: TouchCancelClosure? { get set }
    var touchCancelHandler: (TouchEvent) -> Void { get set }
}

extension TouchCancelHandleable {
    /// The `ontouchcancel` event occurs when the touch event gets interrupted.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchcancel.asp)
    @discardableResult
    public func onTouchCancel(_ handler: @escaping (TouchEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _TouchCancelHandleable else { return self }
        s.touchCancelClosure?.release()
        s.touchCancelClosure = JSClosure { event in
            s.touchCancelHandler(.init(event.jsValue()))
        }
        s.domElement.ontouchcancel = s.touchCancelClosure.jsValue()
        s.touchCancelHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onTouchCancel(_ handler: @escaping () -> Void) -> Self {
        onTouchCancel { _ in handler() }
    }
}
