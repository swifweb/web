//
//  Request.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 09.03.2021.
//

import Foundation
import WebFoundation
import StreamsAPI

/// The resource request
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Request)
public class Request: Bodyable {
    public let jsValue: JSValue
    
    /// Initializer
    /// - Parameters:
    ///   - request: Another request object to copy settings from
    ///   - options: Custom settings that you want to apply to the request
    public init (_ request: Request, options: RequestOptions? = nil) {
        jsValue = JSObject.global.Request.function?.new(request.jsValue, options?.jsValue).jsValue() ?? .undefined
    }
    
    /// Initializer
    /// - Parameters:
    ///   - url: The direct URL of the resource you want to fetch
    ///   - options: Custom settings that you want to apply to the request
    public init (_ url: URLValue, options: RequestOptions? = nil) {
        jsValue = JSObject.global.Request.function?.new(url.urlValue, options?.jsValue).jsValue() ?? .undefined
    }
    
    /// Contains the cache mode of the request.
    ///
    /// It controls how the request will interact with the browser's `HTTP cache`.
    public var cache: RequestCache {
        RequestCache(rawValue: jsValue.cache.string ?? "") ?? .default
    }
    
    /// Indicates whether the user agent should send cookies from the other domain in the case of cross-origin requests.
    public var credentials: RequestCredentials {
        RequestCredentials(rawValue: jsValue.credentials.string ?? "") ?? .sameOrigin
    }
    
    /// Describing the type of content being requested.
    public var destination: String {
        jsValue.destination.string ?? ""
    }
    
    /// Contains headers of request.
    public var headers: [String: String] {
        Headers(jsValue.headers).dictionary
    }
    
    /// Contains the subresource integrity value of the request.
    public var integrity: String {
        jsValue.integrity.string ?? ""
    }
    
    /// Contains the request's method.
    public var method: RequestMethod {
        RequestMethod(rawValue: jsValue.method.string ?? "") ?? .get
    }
    
    ///Contains the mode of the request.
    ///This is used to determine if cross-origin requests lead to valid responses,
    ///and which properties of the response are readable.
    public var mode: RequestMode {
        RequestMode(rawValue: jsValue.mode.string ?? "") ?? .sameOrigin
    }
    
    /// Contains the mode for how redirects are handled.
    public var redirect: RequestRedirect {
        RequestRedirect(rawValue: jsValue.redirect.string ?? "") ?? .follow
    }
    
    /// Contains referrer.
    public var referrer: String {
        jsValue.referrer.string ?? ""
    }
    
    /// Contains referrer policy.
    public var referrerPolicy: String {
        jsValue.referrerPolicy.string ?? ""
    }
    
    /// Contains url.
    public var url: String {
        jsValue.url.string ?? ""
    }
    
    /// A simple getter exposing a `ReadableStream` of the body contents.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Body/body)
    public var body: ReadableStream {
        .init(jsValue.body)
    }
}
