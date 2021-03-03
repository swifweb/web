//
//  Worker.swift
//  Worker
//
//  Created by Mihael Isaev on 01.03.2021.
//

import WebFoundation
import WorkersAPI
import ChannelMessagingAPI

private var worker: Worker!

open class Worker {
    private var isStarted = false
    
    public static var shared: Worker {
        #if !arch(wasm32)
        guard worker == nil else {
            return worker
        }
        worker = Worker.start()
        return worker
        #else
        return worker
        #endif
    }
    public class var current: Self { shared as! Self }

    public required init () {
        
    }
    
    deinit {
        
    }
    
    public static func start() -> Worker {
        guard worker == nil else { return worker }
        worker = Self()
        guard !worker.isStarted else { return worker }
        worker.isStarted = true
        worker.start()
        return worker
    }
    
    private func start() {
        
    }
    
    /// Location associated with the worker.
    ///
    /// It is a specific location object, mostly a subset of the `Location` for browsing scopes, but adapted to workers.
    public var location: WorkerLocation { .init(JSObject.global.location.jsValue()) }
    
    /// The `WorkerNavigator` associated with the worker.
    ///
    /// It is a specific navigator object, mostly a subset of the `Navigator` for browsing scopes, but adapted to workers.
    public var navigator: WorkerNavigator { .init(JSObject.global.navigator.jsValue()) }
}
