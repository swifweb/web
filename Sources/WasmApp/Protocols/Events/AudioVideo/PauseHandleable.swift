//
//  PauseHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PauseHandleable {
    @discardableResult
    func onPause(_ handler: @escaping () -> Void) -> Self
}

protocol _PauseHandleable: _AnyElement, PauseHandleable {
    typealias PauseClosure = JSClosure
    
    var pauseClosure: PauseClosure? { get set }
    var pauseHandler: (HandledEvent) -> Void { get set }
}

extension PauseHandleable {
    /// The onpause event occurs when the audio/video is paused either by the user or programmatically.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpause.asp)
    @discardableResult
    public func onPause(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _PauseHandleable else { return self }
        s.pauseClosure?.release()
        s.pauseClosure = JSClosure { event in
            s.pauseHandler(.init(event.jsValue()))
        }
        s.domElement.onpause = s.pauseClosure.jsValue()
        s.pauseHandler = handler
        return self
    }
    
    @discardableResult
    public func onPause(_ handler: @escaping () -> Void) -> Self {
        onPause { _ in handler() }
    }
}
