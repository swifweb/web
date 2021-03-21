//
//  AbortSignal.swift
//  WebFouncation
//
//  Created by Mihael Isaev on 19.03.2021.
//

import JavaScriptKit

/// The `AbortSignal` interface represents a signal object that allows you to communicate
/// with a DOM request (such as a Fetch) and abort it if required via an `AbortController` object.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
public class AbortSignal {
    public let jsValue: JSValue
    
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
        jsValue.addEventListener.function?.callAsFunction(this: jsValue.object, "abort", JSOneshotClosure { args in
            self.abortClosures.forEach { $0() }
            return .undefined
        })
    }
    
    /// Indicates whether the request(s) the signal is communicating with is/are aborted (true) or not (false).
    public var aborted: Bool {
        jsValue.aborted.boolean ?? false
    }
    
    private var abortClosures: [() -> Void] = []
    
    /// Invoked when the DOM request(s) the signal is communicating with is/are aborted.
    @discardableResult
    public func onAbort(_ closure: @escaping () -> Void) -> Self {
        abortClosures.append(closure)
        return self
    }
}
