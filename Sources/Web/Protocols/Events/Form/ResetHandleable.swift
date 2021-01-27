//
//  ResetHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ResetHandleable {
    @discardableResult
    func onReset(_ handler: @escaping () -> Void) -> Self
}

protocol _ResetHandleable: _AnyElement, ResetHandleable {
    typealias ResetClosure = JSClosure
    
    var resetClosure: ResetClosure? { get set }
    var resetHandler: (HandledEvent) -> Void { get set }
}

extension ResetHandleable {
    /// The onreset event occurs when a form is reset.
    ///
    /// Applicable to <form> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onreset.asp)
    @discardableResult
    public func onReset(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _ResetHandleable else { return self }
        s.resetClosure?.release()
        s.resetClosure = JSClosure { event in
            s.resetHandler(.init(event.jsValue()))
        }
        s.domElement.onreset = s.resetClosure.jsValue()
        s.resetHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onReset(_ handler: @escaping () -> Void) -> Self {
        onReset { _ in handler() }
    }
}
