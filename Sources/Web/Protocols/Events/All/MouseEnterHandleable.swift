//
//  MouseEnterHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MouseEnterHandleable {
    @discardableResult
    func onMouseEnter(_ handler: @escaping () -> Void) -> Self
}

protocol _MouseEnterHandleable: _AnyElement, MouseEnterHandleable {
    typealias MouseEnterClosure = JSClosure
    
    var mouseEnterClosure: MouseEnterClosure? { get set }
    var mouseEnterHandler: (MouseEvent) -> Void { get set }
}

extension MouseEnterHandleable {
    /// The onmouseenter event occurs when the mouse pointer is moved onto an element.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseenter.asp)
    @discardableResult
    public func onMouseEnter(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MouseEnterHandleable else { return self }
        s.mouseEnterClosure?.release()
        s.mouseEnterClosure = JSClosure { event in
            s.mouseEnterHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onmouseenter = s.mouseEnterClosure.jsValue()
        s.mouseEnterHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMouseEnter(_ handler: @escaping () -> Void) -> Self {
        onMouseEnter { _ in handler() }
    }
}
