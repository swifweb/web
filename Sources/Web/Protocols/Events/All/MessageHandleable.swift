//
//  MessageHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol MessageHandleable {
    @discardableResult
    func onMessage(_ handler: @escaping () -> Void) -> Self
}

protocol _MessageHandleable: _AnyElement, MessageHandleable {
    typealias MessageClosure = JSClosure
    
    var messageClosure: MessageClosure? { get set }
    var messageHandler: (HandledEvent) -> Void { get set }
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
    public func onMessage(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _MessageHandleable else { return self }
        s.messageClosure?.release()
        s.messageClosure = JSClosure { event in
            s.messageHandler(.init(event.jsValue()))
        }
        s.domElement.onmessage = s.messageClosure.jsValue()
        s.messageHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onMessage(_ handler: @escaping () -> Void) -> Self {
        onMessage { _ in handler() }
    }
}
