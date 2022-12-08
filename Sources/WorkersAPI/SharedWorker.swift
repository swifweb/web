//
//  SharedWorker.swift
//  WorkersAPI
//
//  Created by Mihael Isaev on 27.02.2021.
//

import WebFoundation
import Events
import ChannelMessagingAPI

/// The SharedWorker interface represents a specific kind of worker that can be accessed
/// from several browsing contexts, such as several windows, iframes or even workers.
/// They implement an interface different than dedicated workers
/// and have a different global scope, [SharedWorkerGlobalScope](https://developer.mozilla.org/en-US/docs/Web/API/SharedWorkerGlobalScope).
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/SharedWorker)
public class SharedWorker: AbstractWorker, EventTarget {
    public lazy var storage: Storage = .init()
    public var jsValue: JSValue
    
    // TODO: implement options
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/SharedWorker/SharedWorker)
    public init? (_ name: String) {
        let path = name.lowercased() + ".js"
        guard let value = JSObject.global["SharedWorker"].function?.new(path).jsValue, !value.isUndefined, value.isNull else {
            return nil
        }
        jsValue = value
    }
    
    /// Object used to communicate with and control the shared worker.
    public var port: MessagePort {
        .init(jsValue.port)
    }
    
}
