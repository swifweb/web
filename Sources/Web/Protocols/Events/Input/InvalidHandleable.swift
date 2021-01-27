//
//  InvalidHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol InvalidHandleable {
    @discardableResult
    func onInvalid(_ handler: @escaping () -> Void) -> Self
}

protocol _InvalidHandleable: _AnyElement, InvalidHandleable {
    typealias InvalidClosure = JSClosure
    
    var invalidClosure: InvalidClosure? { get set }
    var invalidHandler: (HandledEvent) -> Void { get set }
}

extension InvalidHandleable {
    /// The oninvalid event occurs when a submittable `<input>` element is invalid.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oninvalid.asp)
    @discardableResult
    public func onInvalid(_ handler: @escaping (HandledEvent, Self) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _InvalidHandleable else { return self }
        s.invalidClosure?.release()
        s.invalidClosure = JSClosure { event in
            s.invalidHandler(.init(event.jsValue()))
        }
        s.domElement.oninvalid = s.invalidClosure.jsValue()
        s.invalidHandler = {
            handler($0, self)
        }
        #endif
        return self
    }
    
    /// The oninvalid event occurs when a submittable `<input>` element is invalid.
    @discardableResult
    public func onInvalid(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        onInvalid { event, _ in
            handler(event)
        }
    }
    
    /// The oninvalid event occurs when a submittable `<input>` element is invalid.
    @discardableResult
    public func onInvalid(_ handler: @escaping () -> Void) -> Self {
        onInvalid { _ in handler() }
    }
}
