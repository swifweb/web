//
//  MouseUpHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MouseUpHandleable {
    @discardableResult
    func onMouseUp(_ handler: @escaping () -> Void) -> Self
}

protocol _MouseUpHandleable: _AnyElement, MouseUpHandleable {
    typealias MouseUpClosure = JSClosure
    
    var mouseUpClosure: MouseUpClosure? { get set }
    var mouseUpHandler: (MouseEvent) -> Void { get set }
}

extension MouseUpHandleable {
    /// The onmouseup event occurs when a user releases a mouse button over an element.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseup.asp)
    @discardableResult
    public func onMouseUp(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MouseUpHandleable else { return self }
        s.mouseUpClosure?.release()
        s.mouseUpClosure = JSClosure { event in
            s.mouseUpHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onmouseup = s.mouseUpClosure.jsValue()
        s.mouseUpHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMouseUp(_ handler: @escaping () -> Void) -> Self {
        onMouseUp { _ in handler() }
    }
}
