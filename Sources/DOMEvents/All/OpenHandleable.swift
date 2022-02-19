//
//  OpenHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol OpenHandleable: DOMEventable {
    @discardableResult
    func onOpen(_ handler: @escaping () -> Void) -> Self
}

fileprivate class OpenContainer: Container<Event>, StorageKey {
    typealias Value = OpenContainer
}

extension OpenHandleable {
    /// The onopen event occurs when a connection with an event source is opened.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onopen_sse.asp)
    @discardableResult
    public func onOpen(_ handler: @escaping (Self, Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onopen", createOrUpdate(OpenContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The onopen event occurs when a connection with an event source is opened.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onopen_sse.asp)
    @discardableResult
    public func onOpen(_ handler: @escaping (Self) -> Void) -> Self {
        onOpen { _,_ in handler(self) }
    }
    
    /// The onopen event occurs when a connection with an event source is opened.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onopen_sse.asp)
    @discardableResult
    public func onOpen(_ handler: @escaping () -> Void) -> Self {
        onOpen { _ in handler() }
    }
}
