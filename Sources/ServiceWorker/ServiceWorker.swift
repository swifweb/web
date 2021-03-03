//
//  ServiceWorker.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 12.02.2021.
//

import Foundation
import JavaScriptKit

private var serviceworker: ServiceWorker!

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API)
open class ServiceWorker {
    private var isStarted = false
    
    public static var shared: ServiceWorker {
        #if !arch(wasm32)
        guard serviceworker == nil else {
            return serviceworker
        }
        serviceworker = ServiceWorker.start()
        return serviceworker
        #else
        return serviceworker
        #endif
    }
    public class var current: Self { shared as! Self }

    private var activatePromiseClosure: JSClosure?
    private var contentDeletePromiseClosure: JSClosure?
    private var fetchPromiseClosure: JSClosure?
    private var messagePromiseClosure: JSClosure?
    private var notificationClickPromiseClosure: JSClosure?
    private var notificationClosePromiseClosure: JSClosure?
    private var pushPromiseClosure: JSClosure?
    private var pushSubscriptionChangePromiseClosure: JSClosure?
    private var syncPromiseClosure: JSClosure?
    
    required public init () {
        #if arch(wasm32)
        setupPromises()
        #endif
    }
    
    private func setupPromises() {
        activatePromiseClosure = JSClosure { args in // [object ExtendableEvent]
            JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._activate?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        contentDeletePromiseClosure = JSClosure { args in
            debugPrint("contentDelete_event: \(String(describing: args.first))")
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._contentDelete?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        fetchPromiseClosure = JSClosure { args in
            debugPrint("fetch_event: \(String(describing: args.first))")
//            self.addEventListener('fetch', function(event) {
//                // Return data from cache
//                event.respondWith(
//                    caches.match(event.request);
//                );
//            });
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._fetch?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        messagePromiseClosure = JSClosure { args in
            debugPrint("message_event: \(String(describing: args.first))")
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._message?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        notificationClickPromiseClosure = JSClosure { args in
            debugPrint("notificationClick_event: \(String(describing: args.first))")
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._notificationClick?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        notificationClosePromiseClosure = JSClosure { args in
            debugPrint("notificationClose_event: \(String(describing: args.first))")
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._notificationClose?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        pushPromiseClosure = JSClosure { args in
            debugPrint("push_event: \(String(describing: args.first))")
            debugPrint("JSObject.global.Notification: \(String(describing: JSObject.global.Notification))")
            debugPrint("JSObject.global.Notification.permission: \(String(describing: JSObject.global.Notification.function?.permission))")
            if let event = args.first {
                if let text = event.data.text.function?.callAsFunction(this: event.data.object).string {
                    debugPrint("push.text: \(text)")
                } else {
                    debugPrint("push.text: unable to decode")
                }
            }
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._push?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        pushSubscriptionChangePromiseClosure = JSClosure { args in
            debugPrint("pushSubscriptionChange_event: \(String(describing: args.first))")
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._pushSubscriptionChange?() }
                handler(.success(.undefined))
            }).jsValue()
        }
        syncPromiseClosure = JSClosure { args in
            debugPrint("sync_event: \(String(describing: args.first))")
            return JSPromise(resolver: { handler in
                self.lifeCycles.forEach { $0._sync?() }
                handler(.success(.undefined))
            }).jsValue()
        }
    }
    
    deinit {
        activatePromiseClosure?.release()
        contentDeletePromiseClosure?.release()
        fetchPromiseClosure?.release()
        messagePromiseClosure?.release()
        notificationClickPromiseClosure?.release()
        notificationClosePromiseClosure?.release()
        pushPromiseClosure?.release()
        pushSubscriptionChangePromiseClosure?.release()
        syncPromiseClosure?.release()
    }
    
    public static func start() -> ServiceWorker {
        guard serviceworker == nil else { return serviceworker }
        serviceworker = Self()
        guard !serviceworker.isStarted else { return serviceworker }
        serviceworker.isStarted = true
        serviceworker.start()
        return serviceworker
    }
    
    //    var caches: Caches
    //    debugPrint("JSObject.global.caches: \(String(describing: JSObject.global.caches))")
    //    var clients: Clients
    //    debugPrint("JSObject.global.clients: \(String(describing: JSObject.global.clients))")
    //    var registration: Registration
    //    debugPrint("JSObject.global.registration: \(String(describing: JSObject.global.registration))")
        
    private func start() {
        parseServiceBuilderItem(body.serviceBuilderContent)
        #if arch(wasm32)
        if JSObject.global.serviceInstallWasCalled.boolean == true {
            var _lcs = lifeCycles
            func callInstall() {
                if let ls = _lcs.first {
                    _lcs.removeFirst()
                    ls.executeInstalls {
                        switch $0 {
                        case .success:
                            callInstall()
                        case .failure(let error):
                            JSObject.global.serviceInstallationError = error.localizedDescription.jsValue()
                        }
                    }
                } else {
                    JSObject.global.serviceInstalled = true.jsValue()
                }
            }
            callInstall()
        }
        JSObject.global["activate"] = activatePromiseClosure?.jsValue() ?? .null
        JSObject.global["contentDelete"] = contentDeletePromiseClosure?.jsValue() ?? .null
        JSObject.global["fetch"] = fetchPromiseClosure?.jsValue() ?? .null
        JSObject.global["message"] = messagePromiseClosure?.jsValue() ?? .null
        JSObject.global["notificationClick"] = notificationClickPromiseClosure?.jsValue() ?? .null
        JSObject.global["notificationClose"] = notificationClosePromiseClosure?.jsValue() ?? .null
        JSObject.global["push"] = pushPromiseClosure?.jsValue() ?? .null
        JSObject.global["pushSubscriptionChange"] = pushSubscriptionChangePromiseClosure?.jsValue() ?? .null
        JSObject.global["sync"] = syncPromiseClosure?.jsValue() ?? .null
        #else
        printManifestData()
        #endif
    }
    
    /// We should hold event listeners in this array
    private var eventListeners: [EventListener] = []
    private var lifeCycles: [Lifecycle] = []
    private var manifest: Manifest?
    
    @ServiceBuilder open var body: ServiceBuilder.Content { _ServiceContent(serviceBuilderContent: .none) }
    
    private func parseServiceBuilderItem(_ item: ServiceBuilder.Item) {
        switch item {
        case .items(let v): v.forEach { parseServiceBuilderItem($0) }
        case .lifecycle(let v): lifeCycles.append(v)
        case .manifest(let v): manifest = v
        default: break
        }
    }
    
    private func printManifestData() {
        let m = manifest ?? Manifest()
        do {
            let data = try JSONEncoder().encode(m)
            guard let string = String(data: data, encoding: .utf8) else {
                fatalError("Unable print manifest data")
            }
            print(string)
            exit(0)
        } catch {
            fatalError("Unable to encode manifest: \(error)")
        }
    }
}
