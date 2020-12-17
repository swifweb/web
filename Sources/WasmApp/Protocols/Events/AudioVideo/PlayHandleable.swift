//
//  PlayHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PlayHandleable {
    @discardableResult
    func onPlay(_ handler: @escaping () -> Void) -> Self
}

protocol _PlayHandleable: _AnyElement, PlayHandleable {
    typealias PlayClosure = JSClosure
    
    var playClosure: PlayClosure? { get set }
    var playHandler: (HandledEvent) -> Void { get set }
}

extension PlayHandleable {
    /// The onplay event occurs when the audio/video has been started or is no longer paused.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onplay.asp)
    @discardableResult
    public func onPlay(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _PlayHandleable else { return self }
        s.playClosure?.release()
        s.playClosure = JSClosure { event in
            s.playHandler(.init(event.jsValue()))
        }
        s.domElement.onplay = s.playClosure.jsValue()
        s.playHandler = handler
        return self
    }
    
    @discardableResult
    public func onPlay(_ handler: @escaping () -> Void) -> Self {
        onPlay { _ in handler() }
    }
}
