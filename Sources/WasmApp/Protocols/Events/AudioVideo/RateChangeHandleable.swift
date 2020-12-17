//
//  RateChangeHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol RateChangeHandleable {
    @discardableResult
    func onRateChange(_ handler: @escaping () -> Void) -> Self
}

protocol _RateChangeHandleable: _AnyElement, RateChangeHandleable {
    typealias RateChangeClosure = JSClosure
    
    var rateChangeClosure: RateChangeClosure? { get set }
    var rateChangeHandler: (HandledEvent) -> Void { get set }
}

extension RateChangeHandleable {
    /// The `onratechange` event occurs when the playing speed of the audio/video is changed (like when a user switches to a slow motion or fast forward mode).
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onratechange.asp)
    @discardableResult
    public func onRateChange(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _RateChangeHandleable else { return self }
        s.rateChangeClosure?.release()
        s.rateChangeClosure = JSClosure { event in
            s.rateChangeHandler(.init(event.jsValue()))
        }
        s.domElement.onratechange = s.rateChangeClosure.jsValue()
        s.rateChangeHandler = handler
        return self
    }
    
    @discardableResult
    public func onRateChange(_ handler: @escaping () -> Void) -> Self {
        onRateChange { _ in handler() }
    }
}
