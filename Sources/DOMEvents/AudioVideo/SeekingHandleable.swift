//
//  SeekingHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol SeekingHandleable: DOMEventable {
    @discardableResult
    func onSeeking(_ handler: @escaping () -> Void) -> Self
}

fileprivate class SeekingContainer: Container<Event>, StorageKey {
    typealias Value = SeekingContainer
}

extension SeekingHandleable {
    /// The onseeking event occurs when the user starts moving/skipping to a new position in the audio/video.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onseeking.asp)
    @discardableResult
    public func onSeeking(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onseeking", createOrUpdate(SeekingContainer.self, handler))
    }
    
    @discardableResult
    public func onSeeking(_ handler: @escaping () -> Void) -> Self {
        onSeeking { _ in handler() }
    }
}
