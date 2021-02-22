//
//  SubmitHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SubmitHandleable {
    @discardableResult
    func onSubmit(_ handler: @escaping () -> Void) -> Self
}

protocol _SubmitHandleable: _AnyElement, SubmitHandleable {
    typealias SubmitClosure = JSClosure
    
    var submitClosure: SubmitClosure? { get set }
    var submitHandler: (HandledEvent) -> Void { get set }
}

extension SubmitHandleable {
    /// The onsubmit event occurs when a form is submitted.
    ///
    /// Applicable to <form> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onsubmit.asp)
    @discardableResult
    public func onSubmit(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _SubmitHandleable else { return self }
        s.submitClosure?.release()
        s.submitClosure = JSClosure { event in
            s.submitHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onsubmit = s.submitClosure.jsValue()
        s.submitHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onSubmit(_ handler: @escaping () -> Void) -> Self {
        onSubmit { _ in handler() }
    }
}
