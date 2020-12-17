//
//  CanPlayHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol CanPlayHandleable {
    @discardableResult
    func onCanPlay(_ handler: @escaping () -> Void) -> Self
}

protocol _CanPlayHandleable: _AnyElement, CanPlayHandleable {
    typealias CanPlayClosure = JSClosure
    
    var canPlayClosure: CanPlayClosure? { get set }
    var canPlayHandler: (HandledEvent) -> Void { get set }
}

extension CanPlayHandleable {
    /// The oncanplay event occurs when the browser can start playing the specified audio/video (when it has buffered enough to begin).
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncanplay.asp)
    @discardableResult
    public func onCanPlay(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _CanPlayHandleable else { return self }
        s.canPlayClosure?.release()
        s.canPlayClosure = JSClosure { event in
            s.canPlayHandler(.init(event.jsValue()))
        }
        s.domElement.oncanplay = s.canPlayClosure.jsValue()
        s.canPlayHandler = handler
        return self
    }
    
    @discardableResult
    public func onCanPlay(_ handler: @escaping () -> Void) -> Self {
        onCanPlay { _ in handler() }
    }
}
