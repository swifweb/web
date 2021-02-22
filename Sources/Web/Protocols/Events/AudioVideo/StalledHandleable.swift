//
//  StalledHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol StalledHandleable {
    @discardableResult
    func onStalled(_ handler: @escaping () -> Void) -> Self
}

protocol _StalledHandleable: _AnyElement, StalledHandleable {
    typealias StalledClosure = JSClosure
    
    var stalledClosure: StalledClosure? { get set }
    var stalledHandler: (HandledEvent) -> Void { get set }
}

extension StalledHandleable {
    /// The `onstalled` event occurs when the browser is trying to get media data, but data is not available.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onstalled.asp)
    @discardableResult
    public func onStalled(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _StalledHandleable else { return self }
        s.stalledClosure?.release()
        s.stalledClosure = JSClosure { event in
            s.stalledHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onstalled = s.stalledClosure.jsValue()
        s.stalledHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onStalled(_ handler: @escaping () -> Void) -> Self {
        onStalled { _ in handler() }
    }
}
