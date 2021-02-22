//
//  DurationChangeHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DurationChangeHandleable {
    @discardableResult
    func onDurationChange(_ handler: @escaping () -> Void) -> Self
}

protocol _DurationChangeHandleable: _AnyElement, DurationChangeHandleable {
    typealias DurationChangeClosure = JSClosure
    
    var durationChangeClosure: DurationChangeClosure? { get set }
    var durationChangeHandler: (HandledEvent) -> Void { get set }
}

extension DurationChangeHandleable {
    /// The ondurationchange event occurs when the duration of the audio/video is changed.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondurationchange.asp)
    @discardableResult
    public func onDurationChange(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _DurationChangeHandleable else { return self }
        s.durationChangeClosure?.release()
        s.durationChangeClosure = JSClosure { event in
            s.durationChangeHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.ondurationchange = s.durationChangeClosure.jsValue()
        s.durationChangeHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onDurationChange(_ handler: @escaping () -> Void) -> Self {
        onDurationChange { _ in handler() }
    }
}
