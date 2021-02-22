//
//  WheelHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol WheelHandleable {
    @discardableResult
    func onWheel(_ handler: @escaping () -> Void) -> Self
}

protocol _WheelHandleable: _AnyElement, WheelHandleable {
    typealias WheelClosure = JSClosure
    
    var wheelClosure: WheelClosure? { get set }
    var wheelHandler: (WheelEvent) -> Void { get set }
}

extension WheelHandleable {
    /// The onwheel event occurs when the mouse wheel is rolled up or down over an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onwheel.asp)
    @discardableResult
    public func onWheel(_ handler: @escaping (WheelEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _WheelHandleable else { return self }
        s.wheelClosure?.release()
        s.wheelClosure = JSClosure { event in
            s.wheelHandler(WheelEvent(event.jsValue()))
            return .null
        }
        s.domElement.onwheel = s.wheelClosure.jsValue()
        s.wheelHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onWheel(_ handler: @escaping () -> Void) -> Self {
        onWheel { _ in handler() }
    }
}
