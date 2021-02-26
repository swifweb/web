//
//  TimeUpdateHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol TimeUpdateHandleable: DOMEventable {
    @discardableResult
    func onTimeUpdate(_ handler: @escaping () -> Void) -> Self
}

fileprivate class TimeUpdateContainer: Container<Event>, StorageKey {
    typealias Value = TimeUpdateContainer
}

extension TimeUpdateHandleable {
    /// The ontimeupdate event occurs when the playing position of an audio/video has changed.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ontimeupdate.asp)
    @discardableResult
    public func onTimeUpdate(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("ontimeupdate", createOrUpdate(TimeUpdateContainer.self, handler))
    }
    
    @discardableResult
    public func onTimeUpdate(_ handler: @escaping () -> Void) -> Self {
        onTimeUpdate { _ in handler() }
    }
}
