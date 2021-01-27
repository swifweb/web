//
//  MouseOverHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MouseOverHandleable {
    @discardableResult
    func onMouseOver(_ handler: @escaping () -> Void) -> Self
}

protocol _MouseOverHandleable: _AnyElement, MouseOverHandleable {
    typealias MouseOverClosure = JSClosure
    
    var mouseOverClosure: MouseOverClosure? { get set }
    var mouseOverHandler: (MouseEvent) -> Void { get set }
}

extension MouseOverHandleable {
    /// The onmouseover event occurs when the mouse pointer is moved onto an element, or onto one of its children.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseover.asp)
    @discardableResult
    public func onMouseOver(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MouseOverHandleable else { return self }
        s.mouseOverClosure?.release()
        s.mouseOverClosure = JSClosure { event in
            s.mouseOverHandler(.init(event.jsValue()))
        }
        s.domElement.onmouseover = s.mouseOverClosure.jsValue()
        s.mouseOverHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMouseOver(_ handler: @escaping () -> Void) -> Self {
        onMouseOver { _ in handler() }
    }
}
