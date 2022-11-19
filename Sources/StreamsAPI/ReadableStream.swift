//
//  ReadableStream.swift
//  StreamsAPI
//
//  Created by Mihael Isaev on 09.03.2021.
//

import WebFoundation

/// Represents a readable stream of byte data.
///
/// The **Fetch API** offers a concrete instance of a `ReadableStream` through the `body` property of a `Response` object.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream)
public class ReadableStream {
    public let jsValue: JSValue
    
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    /// Advanced initializer
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/ReadableStream)
//    public init (underlyingSource[, queuingStrategy]) {}
    
    /// Returns whether or not the readable stream is locked to a reader.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/locked)
    public var locked: Bool {
        jsValue.locked.boolean ?? false
    }
    
    /// Returns a that resolves when the stream is canceled.
    /// Calling this method signals a loss of interest in the stream by a consumer.
    /// The supplied reason argument will be given to the underlying source, which may or may not use it.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/cancel)
    public func cancel(_ reason: String? = nil, _ closure: ((Result<Void, Error>) -> Void)? = nil) {
        do {
            guard let promise = try jsValue.cancel.function?.throws.callAsFunction(this: jsValue.object, reason).object else {
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
        } catch {
            closure?(.failure(error))
        }
    }
    
    /// Creates a reader and locks the stream to it.
    ///
    /// While the stream is locked, no other reader can be acquired until this one is released.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/getReader)
    public func getReader() -> ReadableStreamDefaultReader {
        ReadableStreamDefaultReader(jsValue.getReader.function?.callAsFunction(optionalThis: jsValue.object) ?? .undefined)
    }
    
    /// Creates a reader and locks the stream to it.
    ///
    /// While the stream is locked, no other reader can be acquired until this one is released.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/getReader)
    public func getBYOBReader() -> ReadableStreamBYOBReader {
        ReadableStreamBYOBReader(jsValue.getReader.function?.callAsFunction(optionalThis: jsValue.object, "byob") ?? .undefined)
    }
    
    /// Provides a chainable way of piping the current stream through a transform stream or any other writable/readable pair.
    ///
    /// Piping a stream will generally lock it for the duration of the pipe, preventing other readers from locking it.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/pipeThrough)
    public func pipeThrough(_ content: TransformStream, _ options: PipeOptions? = nil) throws {
        // TBD
        throw JSError(message: "pipeThrough method is not implemented yet")
    }
    
    /// Pipes the current `ReadableStream` to a given `WritableStream` and returns a Promise that fulfills when the piping process completes successfully, or rejects if any errors were encountered.
    ///
    /// - Parameters:
    ///   - destination: A `WritableStream` that acts as the final destination for the `ReadableStream`.
    ///   - options: The options that should be used when piping to the `writable` stream.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/pipeTo)
    public func pipeTo(_ destination: WritableStream, _ options: PipeOptions? = nil, _ closure: ((Result<Void, Error>) -> Void)? = nil) {
        guard let promise = jsValue.pipeTo.function?.callAsFunction(optionalThis: jsValue.object, destination.jsValue, options)?.object else {
            closure?(.failure(JSError(message: "ReadableStream `pipeTo` method is nil")))
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
    
    /// [Tees](https://streams.spec.whatwg.org/#tee-a-readable-stream) the current readable stream.
    ///
    /// - Returns: A two-element array containing the two resulting branches as new `ReadableStream` instances.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream/tee)
    public func tee() -> [ReadableStream] {
        jsValue.tee.function?.callAsFunction(optionalThis: jsValue.object)?.array?.map { ReadableStream($0) } ?? []
    }
}

extension Blob {
    /// Returns a ReadableStream that can be used to read the contents of the Blob.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Blob/stream)
    public func stream() -> ReadableStream {
        .init(jsValue)
    }
}
