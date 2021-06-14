//
//  Body.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 15.03.2021.
//

import WebFoundation
import StreamsAPI
import Foundation

public final class Body: Bodyable {
    public let jsValue: JSValue
    
    init (jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    /// Declares whether the body has been used in a response yet.
    public var bodyUsed: Bool {
        jsValue.bodyUsed.boolean ?? false
    }
}

public protocol Bodyable {
    var jsValue: JSValue { get }
}

extension Bodyable {
    /// Contains a Bool that indicates whether the body has been read yet.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Body/bodyUsed)
    public var bodyUsed: Bool {
        jsValue.bodyUsed.boolean ?? false
    }
    
    /// A simple getter exposing a `ReadableStream` of the body contents.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Body/body)
    public var body: ReadableStream {
        .init(jsValue.body)
    }
    
    /// Takes a `Response` stream and reads it to completion. It returns a promise that resolves with an `ArrayBuffer`.
    ///
    /// - Parameter closure: Closure which resolves with a `ArrayBuffer`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Body/arrayBuffer)
    public func arrayBuffer(_ closure: @escaping (Result<ArrayBuffer, Error>) -> Void) {
        guard let promise = jsValue.arrayBuffer.function?.callAsFunction(this: jsValue.object).object else { return }
        JSPromise(promise)?.then(success: { value in
            closure(.success(.init(value)))
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Takes a `Response` stream and reads it to completion.
    ///
    /// - Parameter closure: Closure which resolves with a `Blob`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Body/blob)
    public func blob(_ closure: @escaping (Result<Blob, Error>) -> Void) {
        guard let promise = jsValue.blob.function?.callAsFunction(this: jsValue.object).object else { return }
        JSPromise(promise)?.then(success: { value in
            closure(.success(.init(value)))
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Takes a `Response` stream and reads it to completion. It returns a promise that resolves with a `FormData`.
    ///
    /// - Parameter closure: Closure which resolves with a `FormData`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Body/formData)
    public func formData(_ closure: @escaping (Result<FormData, Error>) -> Void) {
        guard let promise = jsValue.formData.function?.callAsFunction(this: jsValue.object).object else { return }
        JSPromise(promise)?.then(success: { value in
            closure(.success(.jsValue(value)))
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Takes a `Response` stream and reads it to completion.
    ///
    /// - Parameter closure: Closure which resolves with a `String`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Body/text)
    public func text(_ closure: @escaping (Result<String, Error>) -> Void) {
        guard let promise = jsValue.text.function?.callAsFunction(this: jsValue.object).object else { return }
        JSPromise(promise)?.then(success: { value in
            closure(.success(value.string ?? ""))
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Takes a `Response` stream and reads it to completion. It returns a promise that resolves with a `String`.
    ///
    /// - Parameters:
    ///   - model: Model you want to decode to. e.g. `MyModel.self`
    ///   - decoder: Optinally you may pass your custom decoder.
    ///   - closure: Closure which resolves with provided model type.
    public func json<T: Decodable>(as model: T.Type, decoder: JSONDecoder? = nil, _ closure: @escaping (Result<T, Error>) -> Void) {
        blob {
            switch $0 {
            case .failure(let error):
                closure(.failure(error))
            case .success(let blob):
                blob.arrayBuffer {
                    switch $0 {
                    case .failure(let error):
                        closure(.failure(error))
                    case .success(let arrayBuffer):
                        do {
                            closure(.success(try arrayBuffer.decode(as: model, decoder: decoder)))
                        } catch {
                            closure(.failure(error))
                        }
                    }
                }
            }
        }
    }
}
