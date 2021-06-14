//
//  Response.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 09.03.2021.
//

import WebFoundation
import StreamsAPI

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Response)
public class Response: Bodyable {
    public let jsValue: JSValue
    
    /// The status code of the response. (This will be 200 for a success).
    public let status: Int
    
    /// The status message corresponding to the status code. (e.g., OK for 200).
    public let statusText: String
    
    /// Indicating whether the response was successful (status in the range 200–299) or not.
    public let ok: Bool
    
    /// Indicates whether or not the response is the result of a redirect (that is, its URL list has more than one entry).
    public let redirected: Bool
    
    /// The `Headers` object associated with the response.
    public let headers: Headers
    
    /// The type of the response.
    public let type: ResponseType
    
    /// The URL of the response.
    public let url: String
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Response/Response)
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
        status = Int(jsValue.status.number ?? -1)
        statusText = jsValue.statusText.string ?? ""
        ok = jsValue.ok.boolean ?? false
        redirected = jsValue.redirected.boolean ?? false
        headers = Headers(jsValue.headers)
        type = ResponseType(rawValue: jsValue.type.string ?? "") ?? .basic
        url = jsValue.url.string ?? ""
    }
    
    public enum ResponseError: String, Error {
        case missingTrailersPromise
        case unableToMakeClone
        case unableToMakeError
        case unableToMakeRedirect
    }
    
    public func trailers(_ handler: @escaping (Result<Headers, Error>) -> Void) {
        guard let promise = jsValue.trailers.object else {
            handler(.failure(ResponseError.missingTrailersPromise))
            return
        }
        JSPromise(promise)?.then(success: {
            handler(.success(.init($0)))
            return JSValue.undefined
        }, failure: {
            handler(.failure($0))
            return JSValue.undefined
        })
    }
    
    /// Creates a clone of a `Response` object.
    ///
    /// `clone()` throws error if the response `Body` has already been used.
    /// In fact, the main reason `clone()` exists is to allow multiple uses of `Body` objects (when they are one-use only.)
    public func clone() throws -> Response {
        guard let clone = try jsValue.clone.function?.`throws`.callAsFunction(this: jsValue.object) else {
            throw ResponseError.unableToMakeClone
        }
        return .init(clone)
    }
    
    /// Returns a new `Response` object associated with a network error.
    public func error() throws -> Response {
        guard let failedResponse = jsValue.error.function?.callAsFunction(this: jsValue.object) else {
            throw ResponseError.unableToMakeError
        }
        return .init(failedResponse)
    }
    
    /// Creates a new response with a different URL.
    /// - Parameters:
    ///   - url: The URL that the new response is to originate from.
    ///   - status: An optional status code for the response (e.g., 302.)
    /// - Returns: A ]Response] object.
    public func redirect(to url: String, status: Int? = nil) throws -> Response {
        guard let redirectResponse = jsValue.redirect.function?.callAsFunction(this: jsValue.object, url, status) else {
            throw ResponseError.unableToMakeRedirect
        }
        return .init(redirectResponse)
    }
    
    // MARK: Body Protocol
    
    /// A simple getter exposing a `ReadableStream` of the body contents.
    public var body: ReadableStream {
        .init(jsValue.body)
    }
}
