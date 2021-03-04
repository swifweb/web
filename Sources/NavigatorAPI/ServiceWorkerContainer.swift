//
//  ServiceWorkerContainer.swift
//  NavigatorAPI
//
//  Created by Mihael Isaev on 27.02.2021.
//

import WebFoundation
import ContentIndexAPI
import NotificationsAPI
import WorkersAPI
import PushAPI
import Events

//if ('serviceWorker' in navigator) {
//    navigator.serviceWorker.register('./\(swJS)');
//}

/// Provides an object representing the service worker
/// as an overall unit in the network ecosystem, including facilities
/// to register, unregister and update service workers,
/// and access the state of service workers and their registrations.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer)
public final class ServiceWorkerContainer {
    /// Reference to JS-object
    let jsValue: JSValue
    
    public var shared: ServiceWorkerContainer? { _sharedNavigator?.serviceWorker }
    
    init? (_ navigator: Navigator) {
        let sw: JSValue = navigator.jsValue.serviceWorker
        guard !sw.isUndefined && !sw.isNull else { return nil }
        self.jsValue = sw
    }
    
    /// An object containing registration options.
    public struct RegistrationOptions: ConvertibleToJSValue {
        /// URL that defines a service worker's registration scope
        /// That is, what range of URLs a service worker can control.
        ///
        /// This is usually a relative URL. It is relative to the base URL of the application.
        /// By default, the scope value for a service worker registration is set to the directory
        /// where the service worker script is located.
        ///
        /// See the [Examples section](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register#examples)
        /// for more information on how it works.
        public let scope: URLConformable
        
        public init (scope: URLConformable) {
            self.scope = scope
        }
        
        public func jsValue() -> JSValue {
            ["scope": scope].jsValue()
        }
    }
    
    public enum RegisterError: Error {
        case unableToRegister
        case jsError(String)
    }
    
    /// Creates or updates a `ServiceWorkerRegistration` for the given scriptURL.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register)
    public func register(_ scriptURL: URLConformable) {
        register(scriptURL) { _ in }
    }
    
    /// Creates or updates a `ServiceWorkerRegistration` for the given scriptURL.
    ///
    /// - Parameters:
    ///   - scriptURL: The URL of the service worker script.
    ///   The registered service worker file needs to have a valid
    ///   [JavaScript MIME type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types#javascript_types).
    ///
    ///   - options: An object containing registration options.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register)
    public func register(
        _ scriptURL: URLConformable,
        _ options: RegistrationOptions? = nil,
        _ handler: @escaping ((Result<ServiceWorkerRegistration, RegisterError>) -> Void)
    ) {
        var arguments: [ConvertibleToJSValue] = [scriptURL]
        if let options = options {
            arguments.append(options)
        }
        if let result = jsValue.register.function?.callAsFunction(this: jsValue.object, arguments) {
            JSPromise(from: result)?.then(success: {
                handler(.success(ServiceWorkerRegistration($0)))
                return JSValue.undefined
            }, failure: {
                if let error = JSError(from: $0) {
                    handler(.failure(.jsError(error.message)))
                } else {
                    handler(.failure(.unableToRegister))
                }
                return JSValue.undefined
            })
        } else {
            handler(.failure(.unableToRegister))
        }
    }
    
    /// Returns a `ServiceWorker` object if its state is `activating` or `activated`
    /// (the same object returned by `ServiceWorkerRegistration.active`).
    ///
    /// This property returns `null` if the request is a force refresh (Shift + refresh) or if there is no active worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/controller)
    public var controller: ServiceWorker? { .init(jsValue.controller) }
    
    public enum GetRegistrationError: Error {
        case unableToGetRegistration
        case notFoundForSpecifiedScope
        case jsError(String)
    }
    
    /// Gets a ServiceWorkerRegistration object whose scope URL matches the provided document URL.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/getRegistration)
    public func getRegistration(_ scope: String, _ handler: @escaping ((Result<ServiceWorkerRegistration, GetRegistrationError>) -> Void)) {
        if let result = jsValue.getRegistration.function?.callAsFunction(this: jsValue.object, scope) {
            JSPromise(from: result)?.then(success: {
                guard !$0.isUndefined && !$0.isNull else {
                    handler(.failure(.notFoundForSpecifiedScope))
                    return JSValue.undefined
                }
                handler(.success(ServiceWorkerRegistration($0)))
                return JSValue.undefined
            }, failure: {
                if let error = JSError(from: $0) {
                    handler(.failure(.jsError(error.message)))
                } else {
                    handler(.failure(.unableToGetRegistration))
                }
                return JSValue.undefined
            })
        } else {
            handler(.failure(.unableToGetRegistration))
        }
    }
    
    public enum GetRegistrationsError: Error {
        case unableToGetRegistrations
        case jsError(String)
    }
    
    /// Gets all ServiceWorkerRegistrations associated with a `ServiceWorkerContainer`, in an array.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/getRegistrations)
    public func getRegistrations(_ handler: @escaping ((Result<[ServiceWorkerRegistration], GetRegistrationsError>) -> Void)) {
        if let result = jsValue.getRegistrations.function?.callAsFunction(this: jsValue.object) {
            JSPromise(from: result)?.then(success: {
                guard !$0.isUndefined, !$0.isNull, let array = $0.array else {
                    handler(.failure(.unableToGetRegistrations))
                    return JSValue.undefined
                }
                let registrations: [ServiceWorkerRegistration] = array.compactMap {
                    guard !$0.isUndefined && !$0.isNull else { return nil }
                    return ServiceWorkerRegistration($0)
                }
                handler(.success(registrations))
                return JSValue.undefined
            }, failure: {
                if let error = JSError(from: $0) {
                    handler(.failure(.jsError(error.message)))
                } else {
                    handler(.failure(.unableToGetRegistrations))
                }
                return JSValue.undefined
            })
        } else {
            handler(.failure(.unableToGetRegistrations))
        }
    }
    
    /// Explicitly starts the flow of messages being dispatched from a service worker to pages under its control.
    ///
    /// **Note**: The messages start being sent automatically
    /// when setting the handler directly using `ServiceWorkerContainer`.`onmessage`.
    /// In this you don't need startMessages().
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/startMessages)
    public func startMessages() {
        jsValue.startMessages.function?.callAsFunction(this: jsValue.object)
    }
    
    private var readyHandlers: [(ServiceWorkerRegistration) -> Void] = []
    
    /// Provides a way of delaying code execution until a service worker is active.
    ///
    /// - Parameter handler: This closure waits indefinitely until the `ServiceWorkerRegistration`
    /// associated with the current page has an active worker.
    /// Once that condition is met, it resolves with the `ServiceWorkerRegistration`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/ready)
    public func onReady(_ handler: @escaping ((ServiceWorkerRegistration) -> Void)) {
        guard readyHandlers.count == 0 else {
            readyHandlers.append(handler)
            return
        }
        readyHandlers.append(handler)
        JSPromise(from: jsValue.ready)?.then(success: {
            guard !$0.isUndefined && !$0.isNull else {
                return JSValue.undefined
            }
            let registration = ServiceWorkerRegistration($0)
            self.readyHandlers.forEach { $0(registration) }
            return JSValue.undefined
        }, failure: { _ in
            return JSValue.undefined
        })
    }
    
    /// Occurs when the document's associated `ServiceWorkerRegistration` acquires a new active worker.
//    navigator.serviceWorker.addEventListener('controllerchange', (e) => {
//      // ...
//    });
    
    /// Fired whenever an error occurs in the associated service workers.
    //    navigator.serviceWorker.addEventListener('error', (e) => {
    //      // ...
    //    });
    
    /// Occurs when incoming messages are received by the ServiceWorkerContainer object (e.g. via a MessagePort.postMessage() call.)
    //    navigator.serviceWorker.addEventListener('message', (e) => {
    //      // ...
    //    });
}

/// Represents the service worker registration.
/// You register a service worker to control one or more pages that share the same origin.
///
/// The lifetime of a service worker registration is beyond that of the `ServiceWorkerRegistration`
/// objects that represent them within the lifetime of their corresponding service worker clients.
/// The browser maintains a persistent list of active `ServiceWorkerRegistration` objects.
public class ServiceWorkerRegistration: EventTarget {
    public lazy var storage: Storage = .init()
    
    /// Reference to JS-object
    public let jsValue: JSValue
    
    private var updateHandlers: [() -> Void] = []
    private lazy var onupdatefoundClosure = JSClosure { _ -> JSValue in
        self.updateHandlers.forEach { $0() }
        return .undefined
    }
    
    init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    deinit {
        onupdatefoundClosure.release()
    }
    
    /// A unique identifier for a service worker registration.
    ///
    /// The service worker must be on the same origin as the document that registers the `ServiceWorker`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/scope)
    public private(set) lazy var scope: String = jsValue.scope.string ?? ""
    
    /// Returns a service worker whose `state` is `installing`.
    /// This property is initially set to null.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/installing)
    public var installing: ServiceWorker? {
        let value = jsValue.installing.jsValue()
        guard !value.isNull, !value.isUndefined else { return nil }
        return .init(value)
    }
    
    /// Returns a service worker whose `state` is `installed`.
    /// This property is initially set to null.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/waiting)
    public var waiting: ServiceWorker? {
        let value = jsValue.waiting.jsValue()
        guard !value.isNull, !value.isUndefined else { return nil }
        return .init(value)
    }
    
    /// Returns a service worker whose `state` is `activating` or `activated`.
    /// This property is initially set to null.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/waiting)
    public var active: ServiceWorker? {
        let value = jsValue.active.jsValue()
        guard !value.isNull, !value.isUndefined else { return nil }
        return .init(value)
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/navigationPreload)
    public var navigationPreload: NavigationPreloadManager? {
        let value = jsValue.navigationPreload.jsValue()
        guard !value.isNull, !value.isUndefined else { return nil }
        return .init(value)
    }
    
    /// A reference to the `PushManager` interface for managing push subscriptions
    ///
    /// This includes support for subscribing, getting an active subscription, and accessing push permission status.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/pushManager)
    public lazy var pushManager = PushManager(jsValue.pushManager)
    
    // sync: SyncManager
    
    /// A reference to the `ContentIndex` interface, which allows for indexing of offline content.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/index)
    public lazy var index = ContentIndex(jsValue.index)
    
    // periodicSync
    
    /// Called whenever an event of type statechange is fired.
    /// It is fired any time the ServiceWorkerRegistration.installing property acquires a new service worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/onupdatefound)
    @discardableResult
    public func onUpdateFound(_ handler: @escaping () -> Void) -> Self {
        updateHandlers.append(handler)
        return self
    }
    
    /// An object containing options to filter the notifications returned.
    public struct GetNotificationsOptions: ConvertibleToJSValue {
        /// Representing a notification tag.
        ///
        /// If specified, only notifications that have this tag will be returned.
        let tag: String
        
        public init (tag: String) {
            self.tag = tag
        }
        
        public func jsValue() -> JSValue {
            ["tag": tag].jsValue()
        }
    }
    
    /// Returns a list of the notifications in the order that they were created
    /// from the current origin via the current service worker registration.
    ///
    /// Origins can have many active but differently-scoped service worker registrations.
    /// Notifications created by one service worker on the same origin will not be available
    /// to other active services workers on that same origin.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/getNotifications)
    public func getNotifications(
        _ options: GetNotificationsOptions? = nil,
        _ handler: @escaping (([Notification]) -> Void)
    ) {
        var arguments: [ConvertibleToJSValue] = []
        if let options = options {
            arguments.append(options)
        }
        if let result = jsValue.getNotifications.function?.callAsFunction(this: jsValue.object, arguments) {
            JSPromise(from: result)?.then(success: {
                handler($0.array?.compactMap { Notification($0) } ?? [])
                return JSValue.undefined
            }, failure: { _ in
                handler([])
                return JSValue.undefined
            })
        } else {
            handler([])
        }
    }
    
    /// Creates a notification on an active service worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/showNotification)
    public func showNotification(_ title: String, _ notification: Notification? = nil) {
        jsValue.showNotification.function?.callAsFunction(this: jsValue.object, title, notification)
    }
    
    /// Attempts to update the service worker.
    ///
    /// It fetches the worker's script URL, and if the new worker is not byte-by-byte identical
    /// to the current worker, it installs the new worker. The fetch of the worker bypasses
    /// any browser caches if the previous fetch occurred over 24 hours ago.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/update)
    public func update() {
        jsValue.update.function?.callAsFunction(this: jsValue.object)
    }
    
    /// Unregisters the service worker registration.
    ///
    /// The service worker will finish any ongoing operations before it is unregistered.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/unregister)
    public func unregister() {
        jsValue.unregister.function?.callAsFunction(this: jsValue.object)
    }
}

/// Provides a reference to a service worker.
public final class ServiceWorker: Worker {
    /// Serialized script URL defined as part of `ServiceWorkerRegistration`.
    ///
    /// Must be on the same origin as the document that registers the `ServiceWorker`.
    public let scriptURL: String
    
    public enum State: String {
        /// The service worker in this state is considered an installing worker.
        /// During this state, ExtendableEvent.waitUntil() can be called inside the `install` event handler
        /// to extend the life of the installing worker until the passed promise resolves successfully.
        /// This is primarily used to ensure that the service worker is not active until all of the core caches are populated.
        case installing
        
        /// The service worker in this state is considered a waiting worker.
        case installed
        
        /// The service worker in this state is considered an active worker.
        /// During this state, `ExtendableEvent.waitUntil()` can be called inside the `onactivate` event handler
        /// to extend the life of the active worker until the passed promise resolves successfully.
        /// No functional events are dispatched until the state becomes activated.
        case activating
        
        /// The service worker in this state is considered an active worker ready to handle functional events.
        case activated
        
        /// A new service worker is replacing the current service worker,
        /// or the current service worker is being discarded due to an install failure.
        case redundant
        
        /// Local case, happens if state is undecodable for some reason
        case unknown
    }
    
    /// Representing the current state of the service worker.
    public var state: State {
        guard let s = jsValue.state.string else { return .unknown }
        return State(rawValue: s) ?? .unknown
    }
    
    /// This initializer always return nil with service worker.
    public override init?(_ name: String) { nil }
    
    /// This initializer used by `ServiceWorkerContainer`.
    ///
    /// Manually you're not able to initialize it.
    public override init (_ value: JSValue) {
        scriptURL = value.scriptURL.string ?? ""
        super.init(value)
    }
    
    private var onstatechangeHandlers: [(State) -> Void] = []
    
    private lazy var onstatechangeClosure: JSClosure = JSClosure { args -> JSValue in
        guard let stateString = args.first?.target.state.string else { return .undefined }
        guard let state = State(rawValue: stateString) else { return .undefined }
        self.onstatechangeHandlers.forEach { $0(state) }
        return .undefined
    }
    
    private func subscribeToEvents() {
        jsValue.onstatechange = onstatechangeClosure.jsValue()
    }
    
    /// This method do nothing with service worker, don't call it.
    public override func terminate() {}
    
    private func shutdown() {
        onstatechangeClosure.release()
        onstatechangeHandlers.removeAll()
    }
    
    deinit {
        shutdown()
    }
}
