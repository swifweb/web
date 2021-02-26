//
//  WaitingHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol WaitingHandleable: DOMEventable {
    @discardableResult
    func onWaiting(_ handler: @escaping () -> Void) -> Self
}

fileprivate class WaitingContainer: Container<Event>, StorageKey {
    typealias Value = WaitingContainer
}

extension WaitingHandleable {
    /// The `onwaiting` event occurs when the video/audio stops because it needs to buffer the next frame.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onwaiting.asp)
    @discardableResult
    public func onWaiting(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onwaiting", createOrUpdate(WaitingContainer.self, handler))
    }
    
    @discardableResult
    public func onWaiting(_ handler: @escaping () -> Void) -> Self {
        onWaiting { _ in handler() }
    }
}
