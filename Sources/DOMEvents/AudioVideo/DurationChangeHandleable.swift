//
//  DurationChangeHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DurationChangeHandleable: DOMEventable {
    @discardableResult
    func onDurationChange(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DurationChangeContainer: Container<Event>, StorageKey {
    typealias Value = DurationChangeContainer
}

extension DurationChangeHandleable {
    /// The ondurationchange event occurs when the duration of the audio/video is changed.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondurationchange.asp)
    @discardableResult
    public func onDurationChange(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondurationchange", createOrUpdate(DurationChangeContainer.self, handler))
    }
    
    @discardableResult
    public func onDurationChange(_ handler: @escaping () -> Void) -> Self {
        onDurationChange { _ in handler() }
    }
}
