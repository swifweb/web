//
//  PlayingHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol PlayingHandleable: DOMEventable {
    @discardableResult
    func onPlaying(_ handler: @escaping () -> Void) -> Self
}

fileprivate class PlayingContainer: Container<Event>, StorageKey {
    typealias Value = PlayingContainer
}

extension PlayingHandleable {
    /// The onplaying event occurs when the audio/video is playing after having been paused or stopped for buffering.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onplaying.asp)
    @discardableResult
    public func onPlaying(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onplaying", createOrUpdate(PlayingContainer.self, handler))
    }
    
    @discardableResult
    public func onPlaying(_ handler: @escaping () -> Void) -> Self {
        onPlaying { _ in handler() }
    }
}
