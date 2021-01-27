//
//  MouseDownHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MouseDownHandleable {
    @discardableResult
    func onMouseDown(_ handler: @escaping () -> Void) -> Self
}

protocol _MouseDownHandleable: _AnyElement, MouseDownHandleable {
    typealias MouseDownClosure = JSClosure
    
    var mouseDownClosure: MouseDownClosure? { get set }
    var mouseDownHandler: (MouseEvent) -> Void { get set }
}

extension MouseDownHandleable {
    /// The onmousedown event occurs when a user presses a mouse button over an element.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousedown.asp)
    @discardableResult
    public func onMouseDown(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MouseDownHandleable else { return self }
        s.mouseDownClosure?.release()
        s.mouseDownClosure = JSClosure { event in
            s.mouseDownHandler(.init(event.jsValue()))
        }
        s.domElement.onmousedown = s.mouseDownClosure.jsValue()
        s.mouseDownHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMouseDown(_ handler: @escaping () -> Void) -> Self {
        onMouseDown { _ in handler() }
    }
}
