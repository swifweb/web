//
//  EventListener.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

import Foundation
import JavaScriptKit

class EventListener {
    private let handler: ([JSValue]) -> Void
    private let closure: JSClosure
    private let event: String
    
    deinit {
        #if arch(wasm32)
        JSObject.global["removeEventListener"].function!.callAsFunction(event, closure)
        closure.release()
        #endif
    }
    
    @discardableResult
    init (event: String, _ handler: @escaping ([JSValue]) -> Void) {
        self.handler = handler
        self.closure = .init {
            handler($0)
            return .boolean(true)
        }
        self.event = event
        #if arch(wasm32)
        JSObject.global["addEventListener"].function!.callAsFunction(event, closure)
        #endif
    }
}
