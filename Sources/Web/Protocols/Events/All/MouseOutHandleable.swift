//
//  MouseOutHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MouseOutHandleable {
    @discardableResult
    func onMouseOut(_ handler: @escaping () -> Void) -> Self
}

protocol _MouseOutHandleable: _AnyElement, MouseOutHandleable {
    typealias MouseOutClosure = JSClosure
    
    var mouseOutClosure: MouseOutClosure? { get set }
    var mouseOutHandler: (MouseEvent) -> Void { get set }
}

extension MouseOutHandleable {
    /// The onmouseout event occurs when the mouse pointer is moved out of an element, or out of one of its children.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseout.asp)
    @discardableResult
    public func onMouseOut(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MouseOutHandleable else { return self }
        s.mouseOutClosure?.release()
        s.mouseOutClosure = JSClosure { event in
            s.mouseOutHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onmouseout = s.mouseOutClosure.jsValue()
        s.mouseOutHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMouseOut(_ handler: @escaping () -> Void) -> Self {
        onMouseOut { _ in handler() }
    }
}
