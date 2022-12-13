//
//  EventTarget.swift
//  Events
//
//  Created by Mihael Isaev on 27.02.2021.
//

import WebFoundation

/// DOM interface implemented by objects that can receive events and may have listeners for them.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget)
public protocol EventTarget: JSValuable, Storageable {}

/// Specifies characteristics about the event listener
public struct EventListenerAddOptions: ConvertibleToJSValue {
    /// Indicates that events of this type will be dispatched to the registered listener
    /// before being dispatched to any EventTarget beneath it in the DOM tree.
    public let capture: Bool
    
    /// Indicating that the listener should be invoked at most once after being added.
    /// If true, the listener would be automatically removed when invoked.
    public let once: Bool
    
    /// If true, indicates that the function specified by listener will never call preventDefault().
    /// If a passive listener does call preventDefault(), the user agent will do nothing other
    /// than generate a console warning. See Improving scrolling performance
    /// with passive listeners to learn more.
    public let passive: Bool
    
    /// ⚠️ A Boolean available only for code running in XBL or in Firefox's chrome
    /// which indicates if the listener will be added to the system group.
    public let mozSystemGroup: Bool?
    
    public init (capture: Bool, once: Bool, passive: Bool, mozSystemGroup: Bool? = nil) {
        self.capture = capture
        self.once = once
        self.passive = passive
        self.mozSystemGroup = mozSystemGroup
    }
    
	public var jsValue: JSValue {
        var result: [String: ConvertibleToJSValue] = [:]
        result["capture"] = capture
        result["once"] = once
        result["passive"] = passive
        if let mozSystemGroup = mozSystemGroup {
            result["mozSystemGroup"] = mozSystemGroup
        }
        return result.jsValue
    }
}

/// Specifies characteristics about the event listener
public struct EventListenerRemoveOptions: ConvertibleToJSValue {
    /// Indicates that events of this type will be dispatched to the registered listener
    /// before being dispatched to any EventTarget beneath it in the DOM tree.
    public let capture: Bool
    
    /// ⚠️ A Boolean available only for code running in XBL or in Firefox's chrome
    /// which indicates if the listener will be added to the system group.
    public let mozSystemGroup: Bool?
    
    public init (capture: Bool, mozSystemGroup: Bool? = nil) {
        self.capture = capture
        self.mozSystemGroup = mozSystemGroup
    }
    
	public var jsValue: JSValue {
        var result: [String: ConvertibleToJSValue] = [:]
        result["capture"] = capture
        if let mozSystemGroup = mozSystemGroup {
            result["mozSystemGroup"] = mozSystemGroup
        }
        return result.jsValue
    }
}

extension EventTarget {
    /// Registers an event handler of a specific event type on the EventTarget.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
    @discardableResult
    public func addEventListener(_ name: EventName, options: EventListenerAddOptions, _ handler: @escaping (AnyEvent) -> Void) -> Self {
        let c = container.createOrUpdate(name, handler)
        jsValue.addEventListener.function?.callAsFunction(optionalThis: jsValue.object, name.value, c.closure)
        return self
    }
    
    /// Registers an event handler of a specific event type on the EventTarget.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
    @discardableResult
    public func addEventListener(_ name: EventName, options: EventListenerAddOptions, _ handler: @escaping () -> Void) -> Self {
        addEventListener(name, options: options) { _ in
            handler()
        }
    }
    
    /// Registers an event handler of a specific event type on the EventTarget.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
    @discardableResult
    public func addEventListener(_ name: EventName, useCapture: Bool? = nil, wantsUntrusted: Bool? = nil, _ handler: @escaping (AnyEvent) -> Void) -> Self {
        let c = container.createOrUpdate(name, handler)
        var args: [ConvertibleToJSValue] = [name.value, c.closure]
        if let useCapture = useCapture {
            args.append(useCapture)
        }
        if let wantsUntrusted = wantsUntrusted {
            args.append(wantsUntrusted)
        }
		jsValue.addEventListener.function?.callAsFunction(optionalThis: jsValue.object, arguments: args)
        return self
    }
    
    /// Registers an event handler of a specific event type on the EventTarget.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
    @discardableResult
    public func addEventListener(_ name: EventName, useCapture: Bool? = nil, wantsUntrusted: Bool? = nil, _ handler: @escaping () -> Void) -> Self {
        addEventListener(name, useCapture: useCapture, wantsUntrusted: wantsUntrusted) { _ in
            handler()
        }
    }
    
    /// Removes an event listener from the EventTarget.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/removeEventListener)
    @discardableResult
    public func removeEventListener(_ name: EventName, options: EventListenerRemoveOptions) -> Self {
        guard let c = container.get(name) else { return self }
        jsValue.removeEventListener.function?.callAsFunction(optionalThis: jsValue.object, name.value, c.closure, options)
        return self
    }
    
    /// Removes an event listener from the EventTarget.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/removeEventListener)
    @discardableResult
    public func removeEventListener(_ name: EventName, useCapture: Bool? = nil) -> Self {
        guard let c = container.get(name) else { return self }
        var args: [ConvertibleToJSValue] = [name.value, c.closure]
        if let useCapture = useCapture {
            args.append(useCapture)
        }
		jsValue.removeEventListener.function?.callAsFunction(optionalThis: jsValue.object, arguments: args)
        return self
    }
    
//    /// Dispatches an event to this EventTarget.
//    ///
//    /// - Parameter event: `Event` object to be dispatched.
//    /// - Returns: The return value is false if event is cancelable and at least one
//    /// of the event handlers which received event called Event.preventDefault().
//    /// Otherwise it returns true.
//    ///
//    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/dispatchEvent)
//    public func dispatchEvent(_ event: Event) -> Bool {
//        // TODO: implement WebJSEcndoer and conform Event to WebJSEncodable
//    }
}

extension EventTarget {
    var container: EventTargetContainer {
        guard let container = storage[EventTargetContainer.self] else {
            let container = EventTargetContainer()
            storage[EventTargetContainer.self] = container
            return container
        }
        return container
    }
}

class EventTargetContainer: AnyStorageValue, StorageKey {
    typealias Value = EventTargetContainer
    
    private lazy var eventListeners: [EventName: EventListenerContainer] = [:]
    
    func get(_ name: EventName) -> EventListenerContainer? {
        eventListeners[name]
    }
    
    func createOrUpdate(_ name: EventName, _ handler: @escaping (EventListenerContainer.BaseEvent) -> Void) -> EventListenerContainer {
        var container: EventListenerContainer
        if let cached = eventListeners[name] {
            container = cached
            container.handlers.append(handler)
        } else {
            container = EventListenerContainer(handler)
            eventListeners[name] = container
        }
        return container
    }
    
    func shutdown() {
        eventListeners.forEach {
            $0.value.shutdown()
        }
    }
}

class EventListenerContainer: AnyStorageValue {
    final class BaseEvent: AnyEvent {
        let jsEvent: JSValue
        let type: EventName
        
        init(_ jsEvent: JSValue) {
            self.jsEvent = jsEvent
            if !jsEvent.isUndefined {
                self.type = .init(stringLiteral: jsEvent.type.string ?? "")
            } else {
                self.type = .init(stringLiteral: "")
            }
        }
        
        convenience init (_ jsEvent: JSValue?) {
            self.init(jsEvent ?? .undefined)
        }
    }
    
    var handlers: [(BaseEvent) -> Void]
    
    lazy var closure: JSClosure = JSClosure { args -> JSValue in
        self.handlers.forEach { $0(.init(args.first)) }
        return .undefined
    }
    
    required init (_ handler: @escaping (BaseEvent) -> Void) {
        handlers = [handler]
    }
    
    deinit {
        #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
        closure.release()
        #endif
    }
    
    func shutdown() {
        #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
        closure.release()
        #endif
        handlers.removeAll()
    }
}
