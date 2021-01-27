//
//  TimeUpdateHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol TimeUpdateHandleable {
    @discardableResult
    func onTimeUpdate(_ handler: @escaping () -> Void) -> Self
}

protocol _TimeUpdateHandleable: _AnyElement, TimeUpdateHandleable {
    typealias TimeUpdateClosure = JSClosure
    
    var timeUpdateClosure: TimeUpdateClosure? { get set }
    var timeUpdateHandler: (HandledEvent) -> Void { get set }
}

extension TimeUpdateHandleable {
    /// The ontimeupdate event occurs when the playing position of an audio/video has changed.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ontimeupdate.asp)
    @discardableResult
    public func onTimeUpdate(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _TimeUpdateHandleable else { return self }
        s.timeUpdateClosure?.release()
        s.timeUpdateClosure = JSClosure { event in
            s.timeUpdateHandler(.init(event.jsValue()))
        }
        s.domElement.ontimeupdate = s.timeUpdateClosure.jsValue()
        s.timeUpdateHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onTimeUpdate(_ handler: @escaping () -> Void) -> Self {
        onTimeUpdate { _ in handler() }
    }
}
