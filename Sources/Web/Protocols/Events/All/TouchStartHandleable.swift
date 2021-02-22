//
//  TouchStartHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol TouchStartHandleable {
    @discardableResult
    func onTouchStart(_ handler: @escaping () -> Void) -> Self
}

protocol _TouchStartHandleable: _AnyElement, TouchStartHandleable {
    typealias TouchStartClosure = JSClosure
    
    var touchStartClosure: TouchStartClosure? { get set }
    var touchStartHandler: (TouchEvent) -> Void { get set }
}

extension TouchStartHandleable {
    /// The touchstart event occurs when the user touches an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchstart.asp)
    @discardableResult
    public func onTouchStart(_ handler: @escaping (TouchEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _TouchStartHandleable else { return self }
        s.touchStartClosure?.release()
        s.touchStartClosure = JSClosure { event in
            s.touchStartHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.ontouchstart = s.touchStartClosure.jsValue()
        s.touchStartHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onTouchStart(_ handler: @escaping () -> Void) -> Self {
        onTouchStart { _ in handler() }
    }
}
