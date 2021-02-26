//
//  PlayHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol PlayHandleable: DOMEventable {
    @discardableResult
    func onPlay(_ handler: @escaping () -> Void) -> Self
}

fileprivate class PlayContainer: Container<Event>, StorageKey {
    typealias Value = PlayContainer
}

extension PlayHandleable {
    /// The onplay event occurs when the audio/video has been started or is no longer paused.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onplay.asp)
    @discardableResult
    public func onPlay(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onplay", createOrUpdate(PlayContainer.self, handler))
    }
    
    @discardableResult
    public func onPlay(_ handler: @escaping () -> Void) -> Self {
        onPlay { _ in handler() }
    }
}
