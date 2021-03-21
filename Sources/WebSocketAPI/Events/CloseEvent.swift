//
//  CloseEvent.swift
//  WebSocketAPI
//
//  Created by Mihael Isaev on 21.03.2021.
//

import WebFoundation
import Events

/// The event sent by the WebSocket object when the connection closes.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/CloseEvent)
public class CloseEvent: Event {
    /// The close code sent by the server.
    public var code: Int {
        Int(jsEvent.code.number ?? 0)
    }
    
    /// Indicating the reason the server closed the connection.
    ///
    /// This is specific to the particular server and sub-protocol.
    public var reason: String {
        jsEvent.reason.string ?? ""
    }
    
    /// Indicates whether or not the connection was cleanly closed.
    public var wasClean: Bool {
        jsEvent.wasClean.boolean ?? false
    }
}
