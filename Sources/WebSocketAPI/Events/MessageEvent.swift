//
//  MessageEvent.swift
//  WebSocketAPI
//
//  Created by Mihael Isaev on 21.03.2021.
//

import WebFoundation
import Events
import ChannelMessagingAPI

/// The event sent by the WebSocket object when a message is received from the server.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/MessageEvent)
public class MessageEvent: Event, CustomStringConvertible {
    public enum MessageEventData: CustomStringConvertible {
        case text(String)
        case arrayBuffer(ArrayBuffer)
        case blob(Blob)
        case unknown(JSValue)
        
        public var description: String {
            switch self {
            case .arrayBuffer(let arrayBuffer): return "\(arrayBuffer)"
            case .blob(let blob): return "\(blob)"
            case .text(let text): return "\"\(text)\""
            case .unknown(let jsValue): return "\(jsValue)"
            }
        }
    }
    
    /// The data sent by the message emitter.
    public var data: MessageEventData {
        if jsEvent.data.isString() {
            return .text(jsEvent.data.string ?? "")
        } else if jsEvent.data.isInstanceOf(ArrayBuffer.self) {
            return .arrayBuffer(.init(jsEvent.data))
        } else if jsEvent.data.isInstanceOf(Blob.self) {
            return .blob(.init(jsEvent.data))
        }
        return .unknown(jsEvent.data)
    }
    
    /// Representing the origin of the message emitter.
    public var origin: String {
        jsEvent.origin.string ?? ""
    }
    
    /// Representing a unique ID for the event.
    public var lastEventId: String {
        jsEvent.lastEventId.string ?? ""
    }
    
    /// A `MessageEventSource` (which can be a `WindowProxy`, `MessagePort`, or `ServiceWorker` object) representing the message emitter.
    public var source: JSValue {
        jsEvent.source
    }
    
    /// An array of `MessagePort` objects representing the ports associated with the channel the message is being sent through
    /// (where appropriate, e.g. in channel messaging or when sending a message to a shared worker).
    public var ports: [MessagePort] {
        jsEvent.ports.array?.map { MessagePort($0) } ?? []
    }
    
    public var description: String {
        "MessageEvent(data: \(data), origin: \"\(origin)\", lastEventId: \"\(lastEventId)\", source: \"\(source)\", ports: [\(ports.map { "\($0.jsValue)" }.joined(separator: ", "))])"
    }
}
