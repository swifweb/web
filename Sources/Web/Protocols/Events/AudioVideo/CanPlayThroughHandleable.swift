//
//  CanPlayThroughHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol CanPlayThroughHandleable {
    @discardableResult
    func onCanPlayThrough(_ handler: @escaping () -> Void) -> Self
}

protocol _CanPlayThroughHandleable: _AnyElement, CanPlayThroughHandleable {
    typealias CanPlayThroughClosure = JSClosure
    
    var canPlayThroughClosure: CanPlayThroughClosure? { get set }
    var canPlayThroughHandler: (HandledEvent) -> Void { get set }
}

extension CanPlayThroughHandleable {
    /// The oncanplaythrough event occurs when the browser estimates
    /// it can play through the specified media without having to stop for buffering.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncanplaythrough.asp)
    @discardableResult
    public func onCanPlayThrough(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _CanPlayThroughHandleable else { return self }
        s.canPlayThroughClosure?.release()
        s.canPlayThroughClosure = JSClosure { event in
            s.canPlayThroughHandler(.init(event.jsValue()))
        }
        s.domElement.oncanplaythrough = s.canPlayThroughClosure.jsValue()
        s.canPlayThroughHandler = handler
        return self
    }
    
    @discardableResult
    public func onCanPlayThrough(_ handler: @escaping () -> Void) -> Self {
        onCanPlayThrough { _ in handler() }
    }
}
