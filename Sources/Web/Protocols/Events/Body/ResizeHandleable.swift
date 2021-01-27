//
//  ResizeHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ResizeHandleable {
    @discardableResult
    func onResize(_ handler: @escaping () -> Void) -> Self
}

protocol _ResizeHandleable: _AnyElement, ResizeHandleable {
    typealias ResizeClosure = JSClosure
    
    var resizeClosure: ResizeClosure? { get set }
    var resizeHandler: (UIEvent) -> Void { get set }
}

extension ResizeHandleable {
    /// The onresize event occurs when the browser window has been resized.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onresize.asp)
    @discardableResult
    public func onResize(_ handler: @escaping (UIEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _ResizeHandleable else { return self }
        s.resizeClosure?.release()
        s.resizeClosure = JSClosure { event in
            s.resizeHandler(.init(event.jsValue()))
        }
        s.domElement.onresize = s.resizeClosure.jsValue()
        s.resizeHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onResize(_ handler: @escaping () -> Void) -> Self {
        onResize { _ in handler() }
    }
}
