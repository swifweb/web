//
//  EventListener.swift
//  
//
//  Created by Mihael Isaev on 17.11.2020.
//

import Foundation
import JavaScriptKit

protocol EventListenerCompatibleObject {
    var domElementName: String { get }
    
    associatedtype Enum: EventListenerCompatibleType
}

protocol EventListenerCompatibleType {
    var rawValue: String { get }
}

class EventListener {
    private let handler: ([JSValue]) -> Void
    private let closure: JSClosure
    private let object, event: String
    
    deinit {
        JSObject.global[object].object!["removeEventListener"].function!.callAsFunction(event, closure)
        closure.release()
    }
    
    @discardableResult
    convenience init<O: EventListenerCompatibleObject>(object: O, event: O.Enum, _ handler: @escaping () -> Void) {
        self.init(object: object.domElementName, event: event.rawValue, handler)
    }
    
    @discardableResult
    convenience init<O: EventListenerCompatibleObject>(object: O, event: O.Enum, _ handler: @escaping ([JSValue]) -> Void) {
        self.init(object: object.domElementName, event: event.rawValue, handler)
    }
    
    @discardableResult
    convenience init<O: EventListenerCompatibleObject>(object: O, event: String, _ handler: @escaping () -> Void) {
        self.init(object: object.domElementName, event: event, handler)
    }
    
    @discardableResult
    convenience init<O: EventListenerCompatibleObject>(object: O, event: String, _ handler: @escaping ([JSValue]) -> Void) {
        self.init(object: object.domElementName, event: event, handler)
    }
    
    @discardableResult
    convenience init (object: String, event: EventListenerCompatibleType, _ handler: @escaping () -> Void) {
        self.init(object: object, event: event.rawValue, handler)
    }
    
    @discardableResult
    convenience init (object: String, event: EventListenerCompatibleType, _ handler: @escaping ([JSValue]) -> Void) {
        self.init(object: object, event: event.rawValue, handler)
    }
    
    @discardableResult
    convenience init (object: String, event: String, _ handler: @escaping () -> Void) {
        self.init(object: object, event: event) { _ in handler() }
    }
    
    @discardableResult
    init (object: String, event: String, _ handler: @escaping ([JSValue]) -> Void) {
        self.handler = handler
        self.closure = .init(self.handler)
        self.object = object
        self.event = event
        JSObject.global[object].object!["addEventListener"].function!.callAsFunction(event, closure)
    }
}