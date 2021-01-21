//
//  OpenHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol OpenHandleable {
    @discardableResult
    func onOpen(_ handler: @escaping () -> Void) -> Self
}

protocol _OpenHandleable: _AnyElement, OpenHandleable {
    typealias OpenClosure = JSClosure
    
    var openClosure: OpenClosure? { get set }
    var openHandler: (HandledEvent) -> Void { get set }
}

extension OpenHandleable {
    /// The onopen event occurs when a connection with an event source is opened.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onopen_sse.asp)
    @discardableResult
    public func onOpen(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _OpenHandleable else { return self }
        s.openClosure?.release()
        s.openClosure = JSClosure { event in
            s.openHandler(.init(event.jsValue()))
        }
        s.domElement.onopen = s.openClosure.jsValue()
        s.openHandler = handler
        return self
    }
    
    @discardableResult
    public func onOpen(_ handler: @escaping () -> Void) -> Self {
        onOpen { _ in handler() }
    }
}
