//
//  ReadableStreamBYOBReader.swift
//  StreamsAPI
//
//  Created by Mihael Isaev on 15.03.2021.
//

import WebFoundation

public class ReadableStreamBYOBReader {
    let jsValue: JSValue
    
    /// Creates and returns a `ReadableStreamBYOBReader` object instance.
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    /// Success calls when the stream closes or the reader's lock is released,,
    /// failure calls if the stream throws an error.
    ///
    /// This method enables you to write code that responds to an end to the streaming process.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStreamBYOBReader/closed)
    public func onClosed(_ closure: @escaping (Result<Void, Error>) -> Void) {
        guard let promise = jsValue.closed.function?.callAsFunction(optionalThis: jsValue.object)?.object else {
            closure(.failure(JSError(message: "ReadableStream `cancel` method is nil")))
            return
        }
        JSPromise(promise)?.then(success: { _ in
            closure(.success(()))
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Returns a that resolves when the stream is canceled.
    /// Calling this method signals a loss of interest in the stream by a consumer.
    /// The supplied reason argument will be given to the underlying source, which may or may not use it.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStreamBYOBReader/cancel)
    public func cancel(_ reason: String? = nil, _ closure: ((Result<Void, Error>) -> Void)? = nil) {
        guard let promise = jsValue.cancel.function?.callAsFunction(optionalThis: jsValue.object, reason)?.object else {
            closure?(.failure(JSError(message: "ReadableStream `cancel` method is nil")))
            return
        }
        JSPromise(promise)?.then(success: { _ in
            closure?(.success(()))
            return JSValue.undefined
        }, failure: { error in
            closure?(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Returns a promise providing access to the next chunk in the stream's internal queue.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStreamBYOBReader/read)
    public func read(_ closure: @escaping (Result<[UInt8], Error>) -> Void) {
        guard let view = JSObject.global.Uint8Array.function?.new().jsValue else {
            closure(.failure(JSError(message: "Unable to create view to read stream into.")))
            return
        }
        guard let promise = jsValue.read.function?.callAsFunction(optionalThis: jsValue.object, view)?.object else {
            closure(.failure(JSError(message: "Unable to get `read` promise.")))
            return
        }
        JSPromise(promise)?.then(success: { response in
            guard let done = response.done.boolean else {
                closure(.failure(JSError(message: "Incorrect stream `read` response.")))
                return JSValue.undefined
            }
            if done {
                closure(.success([]))
            } else {
                guard let _: JSArray = response.value.array else { // TBD: unable to test cause it is still draft in web docs.
                    closure(.failure(JSError(message: "Incorrect stream `read` response.")))
                    return JSValue.undefined
                }
                
            }
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Releases the reader's lock on the stream.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStreamBYOBReader/releaseLock)
    public func releaseLock() {
        jsValue.releaseLock.function?.callAsFunction(optionalThis: jsValue.object)
    }
}
