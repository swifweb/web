//
//  Event.swift
//  Events
//
//  Created by Mihael Isaev on 30.11.2020.
//

import JavaScriptKit

public protocol AnyEvent: AnyObject {
    var jsEvent: JSValue { get }
    var type: EventName { get }
    
    init (_ jsEvent: JSValue)
}

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Event)
open class Event: AnyEvent {
    public let jsEvent: JSValue
    
    /// The name of the event
    public let type: EventName
    
    /// Returns whether or not a specific event is a bubbling event
    public let bubbles: Bool
    
    /// Sets or returns whether the event should propagate up the hierarchy or not
    public let cancelBubble: Bool
    
    /// Returns whether or not an event can have its default action prevented
    public let cancelable: Bool
    
    /// Returns whether the event is composed or not
    public let composed: Bool
    
//    /// Creates a new event
//    public func createEvent() {
//      // TODO
//    }
//
//    /// Returns the event's path
//    public func composedPath() -> String {
//      // TODO
//    }
//
//    /// Returns the element whose event listeners triggered the event
//    let currentTarget: null // TODO
    
    /// Returns whether or not the preventDefault() method was called for the event
    public let defaultPrevented: Bool
    
    /// Returns which phase of the event flow is currently being evaluated
    public let eventPhase: HandledEventPhase
    
    /// Returns whether or not an event is trusted
    public let isTrusted: Bool
    
    /// Cancels the event if it is cancelable, meaning that the default action that belongs to the event will not occur
    public func preventDefault() {
        jsEvent.preventDefault.function?.callAsFunction(optionalThis: jsEvent.object)
    }
    
    /// Prevents other listeners of the same event from being called
    public func stopImmediatePropagation() {
        jsEvent.stopImmediatePropagation.function?.callAsFunction(optionalThis: jsEvent.object)
    }
    
    /// Prevents further propagation of an event during event flow
    public func stopPropagation() {
        jsEvent.stopPropagation.function?.callAsFunction(optionalThis: jsEvent.object)
    }
    
//    /// Returns the element that triggered the event
//    public let target: Any
    
    /// Returns the time (in milliseconds relative to the epoch) at which the event was created
    public let timeStamp: Int
    
    public required init (_ event: JSValue) {
        jsEvent = event
        type = .init(stringLiteral: event.type.string ?? "")
        bubbles = event.bubbles.boolean ?? false
        cancelBubble = event.cancelBubble.boolean ?? false
        cancelable = event.cancelable.boolean ?? false
        composed = event.composed.boolean ?? false
        defaultPrevented = event.defaultPrevented.boolean ?? false
        eventPhase = HandledEventPhase(rawValue: Int(event.eventPhase.number ?? 0)) ?? .none
        isTrusted = event.isTrusted.boolean ?? false
        timeStamp = Int(event.timeStamp.number ?? 0)
    }
}
