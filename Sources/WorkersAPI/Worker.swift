//
//  Worker.swift
//  WorkersAPI
//
//  Created by Mihael Isaev on 27.02.2021.
//

import Foundation
import WebFoundation
import Events
import ChannelMessagingAPI

/// Represents a background task which can send messages back to its creator.
///
/// Workers may themselves spawn new workers,
/// as long as those workers are hosted at the same origin as the parent page.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Worker)
open class Worker: AbstractWorker, EventTarget {
    public lazy var storage: Storage = .init()
    
    /// Reference to JS-object
    public var jsValue: JSValue
    
    private var stringMessageHandlers: [(String) -> Void] = []
    private var eventMessageHandlers: [String: [(Data) -> Void]] = [:]
    private var errorMessageHandlers: [() -> Void] = []
    private var rejectionhandledHandlers: [(String) -> Void] = []
    private var unhandledrejectionHandlers: [(String) -> Void] = []
    
    // TODO: implement options
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Worker/Worker)
    public init? (_ name: String) {
        let path = name.lowercased() + ".js"
        guard let value = JSObject.global["Worker"].function?.new(path).jsValue, !value.isUndefined, value.isNull else {
            return nil
        }
        jsValue = value
        subscribeToEvents()
    }
    
    public init (_ value: JSValue) {
        jsValue = value
        subscribeToEvents()
    }
    
    private lazy var onmessageClosure: JSClosure = JSClosure { args -> JSValue in
        guard let data = args.first?.data.string else { return .undefined }
        if let data = data.data(using: .utf8), let prototype = try? JSONDecoder().decode(WebWorkerEventPrototype.self, from: data) {
            self.eventMessageHandlers[prototype.event]?.forEach { $0(data) }
        } else {
            self.stringMessageHandlers.forEach { $0(data) }
        }
        return .undefined
    }
    
    private lazy var onmessageerrorClosure: JSClosure = JSClosure { _ -> JSValue in
        self.errorMessageHandlers.forEach { $0() }
        return .undefined
    }
    
    private lazy var rejectionhandledClosure: JSClosure = JSClosure { args -> JSValue in
        guard let reason = args.first?.reason.string else { return .undefined }
        self.rejectionhandledHandlers.forEach { $0(reason) }
        return .undefined
    }
    
    private lazy var unhandledrejectionClosure: JSClosure = JSClosure { args -> JSValue in
        guard let reason = args.first?.reason.string else { return .undefined }
        self.unhandledrejectionHandlers.forEach { $0(reason) }
        return .undefined
    }
    
    private func subscribeToEvents() {
        jsValue.onmessage = onmessageClosure.jsValue
        jsValue.onmessageerror = onmessageerrorClosure.jsValue
        jsValue.onrejectionhandled = onmessageerrorClosure.jsValue
        jsValue.onunhandledrejection = onmessageerrorClosure.jsValue
    }
    
    // MARK: Receiving messages
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Worker/onmessageerror)
    @discardableResult
    public func onMessage(_ handler: @escaping (String) -> Void) -> Self {
        stringMessageHandlers.append(handler)
        return self
    }
    
    @discardableResult
    public func onMessage<P: Codable, EID: WebWorkerEID<P>>(_ eid: EID, _ handler: @escaping (P) -> Void) -> Self {
        if eventMessageHandlers[eid.event] == nil {
            eventMessageHandlers[eid.event] = []
        }
        eventMessageHandlers[eid.event]?.append { data in
            if let payload = try? JSONDecoder().decode(WebWorkerEvent<P>.self, from: data).payload {
                handler(payload)
            }
        }
        return self
    }
    
    @discardableResult
    public func onMessage<P: Codable, EID: WebWorkerEID<P>>(_ eid: EID, _ handler: @escaping () -> Void) -> Self {
        if eventMessageHandlers[eid.event] == nil {
            eventMessageHandlers[eid.event] = []
        }
        eventMessageHandlers[eid.event]?.append { _ in
            handler()
        }
        return self
    }
    
    /// Called whenever an `MessageEvent` of type `messageerror` is fired on the Worker instance.
    /// That is, when it receives a message that cannot be deserialized.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Worker/onmessageerror)
    @discardableResult
    public func onMessageError(_ handler: @escaping () -> Void) -> Self {
        errorMessageHandlers.append(handler)
        return self
    }
    
    // MARK: Sending messages
    
    /// Sends a message to the worker's inner scope.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Worker/postMessage)
    @discardableResult
    public func postMessage(_ value: String) -> Self {
        jsValue.postMessage.function?.callAsFunction(optionalThis: jsValue.object, value)
        return self
    }
    
    /// Sends a message to the worker's inner scope.
    @discardableResult
    public func postMessage<P: Codable, EID: WebWorkerEID<P>>(_ eid: EID) -> Self {
        guard let data = try? JSONEncoder().encode(WebWorkerEventPrototype(eid.event)) else { return self }
        guard let message = String(data: data, encoding: .utf8) else { return self }
        jsValue.postMessage.function?.callAsFunction(optionalThis: jsValue.object, message)
        return self
    }
    
    /// Sends a message to the worker's inner scope.
    @discardableResult
    public func postMessage<P: Codable, EID: WebWorkerEID<P>>(_ eid: EID, _ payload: P) -> Self {
        guard let data = try? JSONEncoder().encode(WebWorkerEvent(eid.event, payload)) else { return self }
        guard let message = String(data: data, encoding: .utf8) else { return self }
        jsValue.postMessage.function?.callAsFunction(optionalThis: jsValue.object, message)
        return self
    }
    
    // MARK: Promise Handlers
    
    /// It is sent whenever a JavaScript Promise is rejected but after the promise rejection has been handled.
    /// This can be used in debugging and for general application resiliency, in tandem with the `onUnhandledRejection` event,
    /// which is sent when a promise is rejected but there is no handler for the rejection.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Window/rejectionhandled_event)
    @discardableResult
    public func onRejectionHandled(_ handler: @escaping (String) -> Void) -> Self {
        rejectionhandledHandlers.append(handler)
        return self
    }
    
    /// It is sent when a JavaScript Promise that has no rejection handler is rejected.
    /// Typically, this is the window, but may also be a Worker.
    /// This is useful for debugging and for providing fallback error handling for unexpected situations.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Window/unhandledrejection_event)
    @discardableResult
    public func onUnhandledRejection(_ handler: @escaping (String) -> Void) -> Self {
        unhandledrejectionHandlers.append(handler)
        return self
    }
    
    // MARK: Termination
    
    public private(set) var isTerminated = false
    
    /// Immediately terminates the Worker. This does not offer the worker an opportunity to finish its operations; it is stopped at once.
    open func terminate() {
        guard !isTerminated else { return }
        jsValue.terminate.function?.callAsFunction(optionalThis: jsValue.object)
        isTerminated = true
        shutdown()
    }
    
    private func shutdown() {
        stringMessageHandlers.removeAll()
        eventMessageHandlers.removeAll()
        errorMessageHandlers.removeAll()
        rejectionhandledHandlers.removeAll()
        unhandledrejectionHandlers.removeAll()
    }
    
    deinit {
        shutdown()
    }
}
