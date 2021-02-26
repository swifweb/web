//
//  Lifecycle.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

open class Lifecycle: ServiceBuilderContent {
    public var serviceBuilderContent: ServiceBuilder.Item { .lifecycle(self) }
    
    public required init () {}
    
    // MARK: Activate

    var _activate: (() -> Void)?
    
    /// Occurs when a `ServiceWorkerRegistration`
    /// acquires a new `ServiceWorkerRegistration.active` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/activate_event)
    public func activate(_ handler: @escaping () -> Void) -> Self {
        _activate = handler
        return self
    }
    
    /// Occurs when a `ServiceWorkerRegistration`
    /// acquires a new `ServiceWorkerRegistration.active` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/activate_event)
    public static func activate(_ handler: @escaping () -> Void) -> Self {
        Self().activate(handler)
    }
    
    // MARK: Content Delete
    
    var _contentDelete: (() -> Void)?
    
    /// Occurs when an item is removed from the `Content Index`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/contentdelete_event)
    public func contentDelete(_ handler: @escaping () -> Void) -> Self {
        _contentDelete = handler
        return self
    }
    
    /// Occurs when an item is removed from the `Content Index`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/contentdelete_event)
    public static func contentDelete(_ handler: @escaping () -> Void) -> Self {
        Self().contentDelete(handler)
    }
    
    // MARK: Fetch
    
    var _fetch: (() -> Void)?
    
    /// Occurs when a `fetch()` is called.
    public func fetch(_ handler: @escaping () -> Void) -> Self {
        _fetch = handler
        return self
    }
    
    /// Occurs when a `fetch()` is called.
    public static func fetch(_ handler: @escaping () -> Void) -> Self {
        Self().fetch(handler)
    }
    
    // MARK: Install

    private var _install: (() -> Void)?
    private var _installThrows: (() throws -> Void)?
    private var _installWithCallback: (((Result<Void, Error>) -> Void) -> Void)?
    
    func executeInstalls(_ handler: (Result<Void, Error>) -> Void) {
        _install?()
        do {
            try _installThrows?()
        } catch {
            handler(.failure(error))
        }
        if let _installWithCallback = _installWithCallback {
            _installWithCallback(handler)
        } else {
            handler(.success(()))
        }
    }
    
    /// Occurs when a `ServiceWorkerRegistration` acquires a new `ServiceWorkerRegistration.installing` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
    public func install(_ handler: @escaping () -> Void) -> Self {
        _install = handler
        return self
    }
    
    /// Occurs when a `ServiceWorkerRegistration` acquires a new `ServiceWorkerRegistration.installing` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
    public func install(_ handler: @escaping () throws -> Void) -> Self {
        _installThrows = handler
        return self
    }
    
    /// Occurs when a `ServiceWorkerRegistration` acquires a new `ServiceWorkerRegistration.installing` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
    public func install(_ handler: @escaping ((Result<Void, Error>) -> Void) -> Void) -> Self {
        _installWithCallback = handler
        return self
    }
    
    /// Occurs when a `ServiceWorkerRegistration` acquires a new `ServiceWorkerRegistration.installing` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
    public static func install(_ handler: @escaping () -> Void) -> Self {
        Self().install(handler)
    }
    
    /// Occurs when a `ServiceWorkerRegistration` acquires a new `ServiceWorkerRegistration.installing` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
    public static func install(_ handler: @escaping () throws -> Void) -> Self {
        Self().install(handler)
    }
    
    /// Occurs when a `ServiceWorkerRegistration` acquires a new `ServiceWorkerRegistration.installing` worker.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
    public static func install(_ handler: @escaping ((Result<Void, Error>) -> Void) -> Void) -> Self {
        Self().install(handler)
    }
    
    // MARK: Message
    
    var _message: (() -> Void)?
    
    /// Occurs when incoming messages are received.
    /// Controlled pages can use the `MessagePort.postMessage()` method
    /// to send messages to service workers. The service worker can optionally
    /// send a response back via the `MessagePort` exposed in `event.data.port`,
    /// corresponding to the controlled page.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/message_event)
    public func message(_ handler: @escaping () -> Void) -> Self {
        _message = handler
        return self
    }
    
    /// Occurs when incoming messages are received.
    /// Controlled pages can use the `MessagePort.postMessage()` method
    /// to send messages to service workers. The service worker can optionally
    /// send a response back via the `MessagePort` exposed in `event.data.port`,
    /// corresponding to the controlled page.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/message_event)
    public static func message(_ handler: @escaping () -> Void) -> Self {
        Self().message(handler)
    }
    
    // MARK: Notification Click

    var _notificationClick: (() -> Void)?
    
    /// Occurs when a user clicks on a displayed notification.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/notificationclick_event)
    public func notificationClick(_ handler: @escaping () -> Void) -> Self {
        _notificationClick = handler
        return self
    }
    
    /// Occurs when a user clicks on a displayed notification.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/notificationclick_event)
    public static func notificationClick(_ handler: @escaping () -> Void) -> Self {
        Self().notificationClick(handler)
    }
    
    // MARK: Notification Close

    var _notificationClose: (() -> Void)?
    
    /// Occurs — when a user closes a displayed notification.
    public func notificationClose(_ handler: @escaping () -> Void) -> Self {
        _notificationClose = handler
        return self
    }
    
    /// Occurs — when a user closes a displayed notification.
    public static func notificationClose(_ handler: @escaping () -> Void) -> Self {
        Self().notificationClose(handler)
    }
    
    // MARK: Push

    var _push: (() -> Void)?
    
    /// Occurs when a server push notification is received.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/push_event)
    public func push(_ handler: @escaping () -> Void) -> Self {
        _push = handler
        return self
    }
    
    /// Occurs when a server push notification is received.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/push_event)
    public static func push(_ handler: @escaping () -> Void) -> Self {
        Self().push(handler)
    }
    
    // MARK: Push Subscription Change

    var _pushSubscriptionChange: (() -> Void)?
    
    /// Occurs when a push subscription has been invalidated,
    /// or is about to be invalidated (e.g. when a push service sets an expiration time).
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/pushsubscriptionchange_event)
    public func pushSubscriptionChange(_ handler: @escaping () -> Void) -> Self {
        _pushSubscriptionChange = handler
        return self
    }
    
    /// Occurs when a push subscription has been invalidated,
    /// or is about to be invalidated (e.g. when a push service sets an expiration time).
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/pushsubscriptionchange_event)
    public static func pushSubscriptionChange(_ handler: @escaping () -> Void) -> Self {
        Self().pushSubscriptionChange(handler)
    }
    
    // MARK: Sync

    var _sync: (() -> Void)?
    
    /// Triggered when a call to `SyncManager.register` is made
    /// from a service worker client page. The attempt to sync is made
    /// either immediately if the network is available
    /// or as soon as the network becomes available.
    public func sync(_ handler: @escaping () -> Void) -> Self {
        _sync = handler
        return self
    }
    
    /// Triggered when a call to `SyncManager.register` is made
    /// from a service worker client page. The attempt to sync is made
    /// either immediately if the network is available
    /// or as soon as the network becomes available.
    public static func sync(_ handler: @escaping () -> Void) -> Self {
        Self().sync(handler)
    }
}
