//
//  WritableStream.swift
//  StreamsAPI
//
//  Created by Mihael Isaev on 19.03.2021.
//

import WebFoundation

///
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStream)
public class WritableStream {
    let jsValue: JSValue
    
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    /// A boolean indicating whether the `WritableStream` is locked to a writer.
    public var locked: Bool {
        jsValue.locked.boolean ?? false
    }
    
    /// Returns a that resolves when the stream is canceled.
    /// Calling this method signals a loss of interest in the stream by a consumer.
    /// The supplied reason argument will be given to the underlying source, which may or may not use it.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStream/abort)
    public func abort(_ reason: String, _ closure: ((Result<Void, Error>) -> Void)? = nil) {
        do {
            guard let promise = try jsValue.abort.function?.throws.callAsFunction(this: jsValue.object, reason).object else {
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
    
    /// Closes the stream.
    public func close() {
        jsValue.close.function?.callAsFunction(this: jsValue.object)
    }
    
    /// Returns a new instance of `WritableStreamDefaultWriter` and locks the stream to that instance.
    ///
    /// While the stream is locked, no other writer can be acquired until this one is released.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/WritableStream/getWriter)
    public func getWriter() -> WritableStreamDefaultWriter {
        .init(jsValue.getWriter.function?.callAsFunction(this: jsValue.object) ?? .undefined)
    }
}
