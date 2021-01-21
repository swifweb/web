//
//  SuspendHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SuspendHandleable {
    @discardableResult
    func onSuspend(_ handler: @escaping () -> Void) -> Self
}

protocol _SuspendHandleable: _AnyElement, SuspendHandleable {
    typealias SuspendClosure = JSClosure
    
    var suspendClosure: SuspendClosure? { get set }
    var suspendHandler: (HandledEvent) -> Void { get set }
}

extension SuspendHandleable {
    /// The onsuspend event occurs when the browser is intentionally not getting media data.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onsuspend.asp)
    @discardableResult
    public func onSuspend(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _SuspendHandleable else { return self }
        s.suspendClosure?.release()
        s.suspendClosure = JSClosure { event in
            s.suspendHandler(.init(event.jsValue()))
        }
        s.domElement.onsuspend = s.suspendClosure.jsValue()
        s.suspendHandler = handler
        return self
    }
    
    @discardableResult
    public func onSuspend(_ handler: @escaping () -> Void) -> Self {
        onSuspend { _ in handler() }
    }
}
