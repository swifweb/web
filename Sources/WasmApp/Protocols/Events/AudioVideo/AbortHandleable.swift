//
//  AbortHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AbortHandleable {
    @discardableResult
    func onAbort(_ handler: @escaping () -> Void) -> Self
}

protocol _AbortHandleable: _AnyElement, AbortHandleable {
    typealias AbortClosure = JSClosure
    
    var abortClosure: AbortClosure? { get set }
    var abortHandler: (UIEvent) -> Void { get set }
}

extension AbortHandleable {
    /// The onabort event occurs when the loading of an audio/video is aborted.
    ///
    /// This event occurs when the media data download has been aborted, and not because of an error.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onabort_media.asp)
    @discardableResult
    public func onAbort(_ handler: @escaping (UIEvent) -> Void) -> Self {
        guard let s = self as? _AbortHandleable else { return self }
        s.abortClosure?.release()
        s.abortClosure = JSClosure { event in
            s.abortHandler(.init(event.jsValue()))
        }
        s.domElement.onabort = s.abortClosure.jsValue()
        s.abortHandler = handler
        return self
    }
    
    @discardableResult
    public func onAbort(_ handler: @escaping () -> Void) -> Self {
        onAbort { _ in handler() }
    }
}
