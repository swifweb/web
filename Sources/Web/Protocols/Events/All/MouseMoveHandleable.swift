//
//  MouseMoveHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MouseMoveHandleable {
    @discardableResult
    func onMouseMove(_ handler: @escaping () -> Void) -> Self
}

protocol _MouseMoveHandleable: _AnyElement, MouseMoveHandleable {
    typealias MouseMoveClosure = JSClosure
    
    var mouseMoveClosure: MouseMoveClosure? { get set }
    var mouseMoveHandler: (MouseEvent) -> Void { get set }
}

extension MouseMoveHandleable {
    /// The onmousemove event occurs when the pointer is moving while it is over an element.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousemove.asp)
    @discardableResult
    public func onMouseMove(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MouseMoveHandleable else { return self }
        s.mouseMoveClosure?.release()
        s.mouseMoveClosure = JSClosure { event in
            s.mouseMoveHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onmousemove = s.mouseMoveClosure.jsValue()
        s.mouseMoveHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMouseMove(_ handler: @escaping () -> Void) -> Self {
        onMouseMove { _ in handler() }
    }
}
