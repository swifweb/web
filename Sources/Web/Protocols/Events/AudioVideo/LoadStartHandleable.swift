//
//  LoadStartHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol LoadStartHandleable {
    @discardableResult
    func onLoadStart(_ handler: @escaping () -> Void) -> Self
}

protocol _LoadStartHandleable: _AnyElement, LoadStartHandleable {
    typealias LoadStartClosure = JSClosure
    
    var loadStartClosure: LoadStartClosure? { get set }
    var loadStartHandler: (ProgressEvent) -> Void { get set }
}

extension LoadStartHandleable {
    /// The onloadstart event occurs when the browser starts looking for the specified audio/video.
    /// This is when the loading process starts.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onloadstart.asp)
    @discardableResult
    public func onLoadStart(_ handler: @escaping (ProgressEvent) -> Void) -> Self {
        guard let s = self as? _LoadStartHandleable else { return self }
        s.loadStartClosure?.release()
        s.loadStartClosure = JSClosure { event in
            s.loadStartHandler(.init(event.jsValue()))
        }
        s.domElement.onloadstart = s.loadStartClosure.jsValue()
        s.loadStartHandler = handler
        return self
    }
    
    @discardableResult
    public func onLoadStart(_ handler: @escaping () -> Void) -> Self {
        onLoadStart { _ in handler() }
    }
}
