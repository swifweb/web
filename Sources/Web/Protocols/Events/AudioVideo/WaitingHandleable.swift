//
//  WaitingHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol WaitingHandleable {
    @discardableResult
    func onWaiting(_ handler: @escaping () -> Void) -> Self
}

protocol _WaitingHandleable: _AnyElement, WaitingHandleable {
    typealias WaitingClosure = JSClosure
    
    var waitingClosure: WaitingClosure? { get set }
    var waitingHandler: (HandledEvent) -> Void { get set }
}

extension WaitingHandleable {
    /// The `onwaiting` event occurs when the video/audio stops because it needs to buffer the next frame.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onwaiting.asp)
    @discardableResult
    public func onWaiting(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _WaitingHandleable else { return self }
        s.waitingClosure?.release()
        s.waitingClosure = JSClosure { event in
            s.waitingHandler(.init(event.jsValue()))
        }
        s.domElement.onwaiting = s.waitingClosure.jsValue()
        s.waitingHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onWaiting(_ handler: @escaping () -> Void) -> Self {
        onWaiting { _ in handler() }
    }
}
