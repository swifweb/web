//
//  MessageHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MessageHandleable: DOMEventable {
    @discardableResult
    func onMessage(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MessageContainer: Container<Event>, StorageKey {
    typealias Value = MessageContainer
}

extension MessageHandleable {
    /// The onmessage event occurs when a message is received through an event source.
    ///
    /// The event object for the onmessage event supports the following properties:
    ///
    /// data - Contains the actual message
    /// origin - The URL of the document that invoked the event
    /// lastEventId - the identifier of the last message seen in the event stream
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmessage_sse.asp)
    @discardableResult
    public func onMessage(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmessage", createOrUpdate(MessageContainer.self, handler))
    }
    
    @discardableResult
    public func onMessage(_ handler: @escaping () -> Void) -> Self {
        onMessage { _ in handler() }
    }
}
