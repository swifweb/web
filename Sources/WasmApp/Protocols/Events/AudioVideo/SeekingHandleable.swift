//
//  SeekingHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SeekingHandleable {
    @discardableResult
    func onSeeking(_ handler: @escaping () -> Void) -> Self
}

protocol _SeekingHandleable: _AnyElement, SeekingHandleable {
    typealias SeekingClosure = JSClosure
    
    var seekingClosure: SeekingClosure? { get set }
    var seekingHandler: (HandledEvent) -> Void { get set }
}

extension SeekingHandleable {
    /// The onseeking event occurs when the user starts moving/skipping to a new position in the audio/video.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onseeking.asp)
    @discardableResult
    public func onSeeking(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _SeekingHandleable else { return self }
        s.seekingClosure?.release()
        s.seekingClosure = JSClosure { event in
            s.seekingHandler(.init(event.jsValue()))
        }
        s.domElement.onseeking = s.seekingClosure.jsValue()
        s.seekingHandler = handler
        return self
    }
    
    @discardableResult
    public func onSeeking(_ handler: @escaping () -> Void) -> Self {
        onSeeking { _ in handler() }
    }
}
