//
//  TouchEndHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol TouchEndHandleable {
    @discardableResult
    func onTouchEnd(_ handler: @escaping () -> Void) -> Self
}

protocol _TouchEndHandleable: _AnyElement, TouchEndHandleable {
    typealias TouchEndClosure = JSClosure
    
    var touchEndClosure: TouchEndClosure? { get set }
    var touchEndHandler: (TouchEvent) -> Void { get set }
}

extension TouchEndHandleable {
    /// The `ontouchend` event occurs when the user removes the finger from an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_touchend.asp)
    @discardableResult
    public func onTouchEnd(_ handler: @escaping (TouchEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _TouchEndHandleable else { return self }
        s.touchEndClosure?.release()
        s.touchEndClosure = JSClosure { event in
            s.touchEndHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.ontouchend = s.touchEndClosure.jsValue()
        s.touchEndHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onTouchEnd(_ handler: @escaping () -> Void) -> Self {
        onTouchEnd { _ in handler() }
    }
}
