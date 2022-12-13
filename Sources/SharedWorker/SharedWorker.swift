//
//  SharedWorker.swift
//  SharedWorker
//
//  Created by Mihael Isaev on 01.03.2021.
//

import WebFoundation
import WorkersAPI
import ChannelMessagingAPI

private var sharedworker: SharedWorker!

open class SharedWorker {
    private var isStarted = false
    
    public static var shared: SharedWorker {
        #if !arch(wasm32)
        guard sharedworker == nil else {
            return sharedworker
        }
        sharedworker = SharedWorker.start()
        return sharedworker
        #else
        return sharedworker
        #endif
    }
    public class var current: Self { shared as! Self }

    public required init () {
        
    }
    
    deinit {
        
    }
    
    public static func start() -> SharedWorker {
        guard sharedworker == nil else { return sharedworker }
        sharedworker = Self()
        guard !sharedworker.isStarted else { return sharedworker }
        sharedworker.isStarted = true
        sharedworker.start()
        return sharedworker
    }
    
    private func start() {
        
    }
    
    // MARK: - Global scope
    
    /// Handler called when a `MessagePort` connection is opened
    /// between the associated `SharedWorker` and the main thread.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/SharedWorkerGlobalScope/onconnect)
    @discardableResult
    public func onConnect(_ handler: @escaping (MessagePort) -> Void) -> Self {
        JSObject.global.onconnect = JSOneshotClosure { args -> JSValue in
            guard let portObject = args.first?.array?.first else { return .undefined }
            handler(MessagePort(portObject.jsValue))
            return .undefined
        }.jsValue
        return self
    }
    
    /// Discards any tasks queued in the worker's event loop, effectively closing its particular scope.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/SharedWorkerGlobalScope/close)
    public func close() {
        JSObject.global.close.function?.callAsFunction()
    }
    
    /// Synchronously imports one or more scripts into the worker's scope.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WorkerGlobalScope/importScripts)
    public func importScripts(_ paths: [String]) {
        JSObject.global.importScripts.function?.callAsFunction(paths.jsValue)
    }
    
    /// Synchronously imports one or more scripts into the worker's scope.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WorkerGlobalScope/importScripts)
    public func importScripts(_ paths: String...) {
        importScripts(paths)
    }
    
    /// The name that the SharedWorker was (optionally) given when it was created.
    public var name: String {
        JSObject.global.name.string ?? ""
    }
    
    /// Location associated with the worker.
    ///
    /// It is a specific location object, mostly a subset of the `Location` for browsing scopes, but adapted to workers.
    public var location: WorkerLocation { .init(JSObject.global.location.jsValue) }
    
    /// The `WorkerNavigator` associated with the worker.
    ///
    /// It is a specific navigator object, mostly a subset of the `Navigator` for browsing scopes, but adapted to workers.
    public var navigator: WorkerNavigator { .init(JSObject.global.navigator.jsValue) }
}
