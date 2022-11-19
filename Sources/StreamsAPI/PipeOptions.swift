//
//  PipeOptions.swift
//  StreamsAPI
//
//  Created by Mihael Isaev on 19.03.2021.
//

import WebFoundation

/// The options that should be used when piping to the writable stream.
public struct PipeOptions: ConvertibleToJSValue {
    /// If this is set to true, the source `ReadableStream` closing will no longer cause the destination `WritableStream` to be closed.
    ///
    /// The method will return a fulfilled promise once this process completes, unless an error is encountered
    /// while closing the destination in which case it will be rejected with that error.
    public let preventClose: Bool?
    
    /// If this is set to true, errors in the source `ReadableStream` will no longer abort the destination `WritableStream`.
    ///
    /// The method will return a promise rejected with the source’s error, or with any error that occurs during aborting the destination.
    public let preventAbort: Bool?
    
    /// If this is set to true, errors in the destination `WritableStream` will no longer cancel the source `ReadableStream`.
    ///
    /// In this case the method will return a promise rejected with the source’s error,
    /// or with any error that occurs during canceling the source.
    ///
    /// In addition, if the destination writable stream starts out closed or closing, the source readable stream will no longer be canceled.
    /// In this case the method will return a promise rejected with an error indicating piping to a closed stream failed, or with any error that occurs during canceling the source.
    public let preventCancel: Bool?
    
    /// If set to an `AbortSignal` object, ongoing pipe operations can then be aborted via the corresponding AbortController.
    public let signal: AbortSignal?
    
    public init (preventClose: Bool? = nil, preventAbort: Bool? = nil, preventCancel: Bool? = nil, signal: AbortSignal? = nil) {
        self.preventClose = preventClose
        self.preventAbort = preventAbort
        self.preventCancel = preventCancel
        self.signal = signal
    }
    
	public var jsValue: JSValue {
        var result: [String: ConvertibleToJSValue] = [:]
        if let preventClose = preventClose {
            result["preventClose"] = preventClose.jsValue()
        }
        if let preventAbort = preventAbort {
            result["preventAbort"] = preventAbort.jsValue()
        }
        if let preventCancel = preventCancel {
            result["preventCancel"] = preventCancel.jsValue()
        }
        if let signal = signal {
            result["signal"] = signal.jsValue
        }
        return result.jsValue
    }
}
