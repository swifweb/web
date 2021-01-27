//
//  TouchMoveHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol TouchMoveHandleable {
    @discardableResult
    func onTouchMove(_ handler: @escaping () -> Void) -> Self
}

protocol _TouchMoveHandleable: _AnyElement, TouchMoveHandleable {
    typealias TouchMoveClosure = JSClosure
    
    var touchMoveClosure: TouchMoveClosure? { get set }
    var touchMoveHandler: (TouchEvent) -> Void { get set }
}

extension TouchMoveHandleable {
    /// The touchmove event occurs when the user moves the finger across the screen.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchmove.asp)
    @discardableResult
    public func onTouchMove(_ handler: @escaping (TouchEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _TouchMoveHandleable else { return self }
        s.touchMoveClosure?.release()
        s.touchMoveClosure = JSClosure { event in
            s.touchMoveHandler(.init(event.jsValue()))
        }
        s.domElement.ontouchmove = s.touchMoveClosure.jsValue()
        s.touchMoveHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onTouchMove(_ handler: @escaping () -> Void) -> Self {
        onTouchMove { _ in handler() }
    }
}
