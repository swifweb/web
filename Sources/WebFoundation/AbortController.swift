//
//  AbortController.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 19.03.2021.
//

import JavaScriptKit

/// Represents a controller object that allows you to abort one or more Web requests as and when desired.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/AbortController)
public class AbortController {
    let jsValue: JSValue
    
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    /// Creates a new `AbortController` object instance.
    public init () {
        jsValue = JSObject.global.AbortController.function?.new().jsValue ?? .undefined
    }
    
    /// Returns a `AbortSignal` object instance, which can be used to communicate with/abort a DOM request.
    public var signal: AbortSignal {
        .init(jsValue.signal)
    }
    
    /// Aborts a DOM request before it has completed.
    ///
    /// This is able to abort fetch requests, consumption of any response `Body`, and streams.
    public func abort() {
        
    }
}
