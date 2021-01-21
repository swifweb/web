//
//  PlayingHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PlayingHandleable {
    @discardableResult
    func onPlaying(_ handler: @escaping () -> Void) -> Self
}

protocol _PlayingHandleable: _AnyElement, PlayingHandleable {
    typealias PlayingClosure = JSClosure
    
    var playingClosure: PlayingClosure? { get set }
    var playingHandler: (HandledEvent) -> Void { get set }
}

extension PlayingHandleable {
    /// The onplaying event occurs when the audio/video is playing after having been paused or stopped for buffering.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onplaying.asp)
    @discardableResult
    public func onPlaying(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _PlayingHandleable else { return self }
        s.playingClosure?.release()
        s.playingClosure = JSClosure { event in
            s.playingHandler(.init(event.jsValue()))
        }
        s.domElement.onplaying = s.playingClosure.jsValue()
        s.playingHandler = handler
        return self
    }
    
    @discardableResult
    public func onPlaying(_ handler: @escaping () -> Void) -> Self {
        onPlaying { _ in handler() }
    }
}
