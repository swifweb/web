//
//  PauseHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol PauseHandleable: DOMEventable {
    @discardableResult
    func onPause(_ handler: @escaping () -> Void) -> Self
}

fileprivate class PauseContainer: Container<Event>, StorageKey {
    typealias Value = PauseContainer
}

extension PauseHandleable {
    /// The onpause event occurs when the audio/video is paused either by the user or programmatically.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpause.asp)
    @discardableResult
    public func onPause(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onpause", createOrUpdate(PauseContainer.self, handler))
    }
    
    @discardableResult
    public func onPause(_ handler: @escaping () -> Void) -> Self {
        onPause { _ in handler() }
    }
}
