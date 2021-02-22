//
//  ProgressHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ProgressHandleable {
    @discardableResult
    func onProgress(_ handler: @escaping () -> Void) -> Self
}

protocol _ProgressHandleable: _AnyElement, ProgressHandleable {
    typealias ProgressClosure = JSClosure
    
    var progressClosure: ProgressClosure? { get set }
    var progressHandler: (HandledEvent) -> Void { get set }
}

extension ProgressHandleable {
    /// The onprogress event occurs when the browser is downloading the specified audio/video.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onprogress.asp)
    @discardableResult
    public func onProgress(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _ProgressHandleable else { return self }
        s.progressClosure?.release()
        s.progressClosure = JSClosure { event in
            s.progressHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onprogress = s.progressClosure.jsValue()
        s.progressHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onProgress(_ handler: @escaping () -> Void) -> Self {
        onProgress { _ in handler() }
    }
}
