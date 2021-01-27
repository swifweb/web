//
//  MouseLeaveHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MouseLeaveHandleable {
    @discardableResult
    func onMouseLeave(_ handler: @escaping () -> Void) -> Self
}

protocol _MouseLeaveHandleable: _AnyElement, MouseLeaveHandleable {
    typealias MouseLeaveClosure = JSClosure
    
    var mouseLeaveClosure: MouseLeaveClosure? { get set }
    var mouseLeaveHandler: (MouseEvent) -> Void { get set }
}

extension MouseLeaveHandleable {
    /// The `onmouseleave` event occurs when the mouse pointer is moved out of an element.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseleave.asp)
    @discardableResult
    public func onMouseLeave(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MouseLeaveHandleable else { return self }
        s.mouseLeaveClosure?.release()
        s.mouseLeaveClosure = JSClosure { event in
            s.mouseLeaveHandler(.init(event.jsValue()))
        }
        s.domElement.onmouseleave = s.mouseLeaveClosure.jsValue()
        s.mouseLeaveHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMouseLeave(_ handler: @escaping () -> Void) -> Self {
        onMouseLeave { _ in handler() }
    }
}
