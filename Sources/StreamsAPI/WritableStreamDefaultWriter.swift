//
//  WritableStreamDefaultWriter.swift
//  StreamsAPI
//
//  Created by Mihael Isaev on 19.03.2021.
//

import WebFoundation

public class WritableStreamDefaultWriter {
    let jsValue: JSValue
    
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    /// Creates a new WritableStreamDefaultWriter object instance.
    ///
    /// - Parameter stream: The WritableStream to be written to.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter/WritableStreamDefaultWriter)
    public init (_ stream: WritableStream) {
        self.jsValue = JSObject.global.WritableStreamDefaultWriter.function?.new(stream.jsValue).jsValue() ?? .undefined
    }
    
    /// Allows you to write code that responds to an end to the streaming process.
    ///
    /// Success calls when the stream closes, failure calls if the stream throws an error.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter/closed)
    public func onClosed(_ closure: @escaping (Result<Void, Error>) -> Void) {
        guard let promise = jsValue.closed.function?.callAsFunction(this: jsValue.object).object else {
            closure(.failure(JSError(message: "WritableStreamDefaultWriter `closed` method is nil")))
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
    
    /// Returns the desired size required to fill the stream's internal queue.
    ///
    /// Note that this can be negative if the queue is over-full.
    ///
    /// The value will be nil if the stream cannot be successfully written to (due to either being errored, or having an abort queued up),
    /// and zero if the stream is closed.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter/desiredSize)
    public var desiredSize: Int64? {
        guard let value = jsValue.desiredSize.number else { return nil }
        return Int64(value)
    }
    
    /// Success calls when the desired size of the stream's internal queue transitions from non-positive to positive,
    /// signaling that it is no longer applying backpressure.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter)
    public func onReady(_ closure: @escaping (Result<Void, Error>) -> Void) {
        guard let promise = jsValue.ready.function?.callAsFunction(this: jsValue.object).object else {
            closure(.failure(JSError(message: "WritableStreamDefaultWriter `ready` method is nil")))
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
    
    /// Aborts the stream, signaling that the producer can no longer successfully write to the stream
    /// and it is to be immediately moved to an error state, with any queued writes discarded.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter/abort)
    public func abort(_ closure: ((Result<Void, Error>) -> Void)? = nil) {
        guard let promise = jsValue.abort.function?.callAsFunction(this: jsValue.object).object else {
            closure?(.failure(JSError(message: "WritableStreamDefaultWriter `abort` method is nil")))
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
    
    /// Closes the associated writable stream.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter/close)
    public func close(_ closure: ((Result<Void, Error>) -> Void)? = nil) {
        guard let promise = jsValue.close.function?.callAsFunction(this: jsValue.object).object else {
            closure?(.failure(JSError(message: "WritableStreamDefaultWriter `close` method is nil")))
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
    
    /// Releases the writer's lock on the corresponding stream.
    ///
    /// After the lock is released, the writer is no longer active.
    ///
    /// If the associated stream is errored when the lock is released,
    /// the writer will appear errored in the same way from now on;
    /// otherwise, the writer will appear closed.
    ///
    /// [Learn more](WritableStreamDefaultWriter.releaseLock())
    public func releaseLock() {
        jsValue.releaseLock.function?.callAsFunction(this: jsValue.object)
    }
    
    /// Writes a passed chunk of data to a `WritableStream` and its underlying sink.
    ///
    /// - Parameters:
    ///   - chunk: A block of binary data to pass to the WritableStream.
    ///   - closure: optional closure
    ///
    /// Closure calls to indicate the success or failure of the write operation.
    ///
    /// Note that what "success" means is up to the underlying sink;
    /// it might indicate that the chunk has been accepted, and not necessarily that it is safely saved to its ultimate destination.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter/write)
    public func write(_ chunk: [UInt8], _ closure: ((Result<Void, Error>) -> Void)? = nil) {
        guard let promise = jsValue.write.function?.callAsFunction(this: jsValue.object, chunk.jsValue()).object else {
            closure?(.failure(JSError(message: "WritableStreamDefaultWriter `write` method is nil")))
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
}
