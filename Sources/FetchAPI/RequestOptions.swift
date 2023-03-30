//
//  RequestOptions.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 14.03.2021.
//

import WebFoundation
import StreamsAPI

public class RequestOptions {
    public var jsValue: JSValue {
        var jsValue = [:].jsValue
        jsValue.method = method.rawValue.jsValue
        jsValue.headers = headers
        if let body {
            jsValue.body = body
        }
        jsValue.mode = mode.rawValue.jsValue
        jsValue.credentials = credentials.rawValue.jsValue
        if let cache {
            jsValue.cache = cache.jsValue
        }
        jsValue.redirect = redirect.rawValue.jsValue
        if let referrer {
            jsValue.referrer = referrer.jsValue
        }
        if let integrity {
            jsValue.integrity = integrity.jsValue
        }
        Console.dir(jsValue)
        return jsValue
    }
    
    /// The request method, e.g., GET, POST. The default is GET.
    public var method: RequestMethod = .get
    
    /// Headers you want to add to your request.
    public private(set) var headers: JSValue = JSObject.global.Headers.function?.new().jsValue ?? .null
    
    /// Body that you want to add to your request.
    ///
    /// Note that a request using the `GET` or `HEAD` method cannot have a body.
    public var body: JSValue?
    
    /// The mode you want to use for the request.
    ///
    /// The default is `cors`.
    public var mode: RequestMode = .cors
    
    /// The request credentials you want to use for the request. The default is same-origin.
    public var credentials: RequestCredentials = .sameOrigin
    
    /// The cache mode you want to use for the request.
    public var cache: String?
    
    /// The redirect mode to use: follow, error, or manual. The default is follow.
    public var redirect: RedirectMode = .follow
    
    /// A String specifying no-referrer, client, or a URL. The default is about:client.
    public var referrer: String?
    
    /// Contains the subresource integrity value of the request (e.g., sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=).
    public var integrity: String?
    
    public init () {}
    
    /// The request method, e.g., GET, POST. The default is GET.
    @discardableResult
    public func method(_ value: RequestMethod) -> Self {
        method = value
        return self
    }
    
    /// Headers you want to add to your request.
    @discardableResult
    public func headers(_ value: [String: String]) -> Self {
        for (key, value) in value {
            headers.append.function?.callAsFunction(optionalThis: headers.object, key.jsValue, value.jsValue)
        }
        return self
    }
    
    /// Headers you want to add to your request.
    @discardableResult
    public func header(_ key: String, _ value: String) -> Self {
        headers.append.function?.callAsFunction(optionalThis: headers.object, key.jsValue, value.jsValue)
        return self
    }
    
    /// Body that you want to add to your request.
    ///
    /// Note that a request using the `GET` or `HEAD` method cannot have a body.
    @discardableResult
    public func body(_ value: Blob) -> Self {
        self.body = value.jsValue
        return self
    }
    
    /// Body that you want to add to your request.
    ///
    /// Note that a request using the `GET` or `HEAD` method cannot have a body.
    @discardableResult
    public func body(_ value: BufferSource) -> Self {
        self.body = value.jsValue
        return self
    }
    
    /// Body that you want to add to your request.
    ///
    /// Note that a request using the `GET` or `HEAD` method cannot have a body.
    @discardableResult
    public func body(_ value: FormData) -> Self {
        self.body = value.jsValue
        return self
    }
    
    /// Body that you want to add to your request.
    ///
    /// Note that a request using the `GET` or `HEAD` method cannot have a body.
    @discardableResult
    public func body(_ value: URLSearchParams) -> Self {
        self.body = value.jsValue
        return self
    }
    
    /// Body that you want to add to your request.
    ///
    /// Note that a request using the `GET` or `HEAD` method cannot have a body.
    @discardableResult
    public func body(_ value: String) -> Self {
        self.body = value.jsValue
        return self
    }
    
    /// Body that you want to add to your request.
    ///
    /// Note that a request using the `GET` or `HEAD` method cannot have a body.
    @discardableResult
    public func body(_ value: ReadableStream) -> Self {
        self.body = value.jsValue
        return self
    }
    
    /// The mode you want to use for the request.
    ///
    /// The default is `cors`.
    @discardableResult
    public func mode(_ value: RequestMode) -> Self {
        mode = value
        return self
    }
    
    /// The request credentials you want to use for the request.
    ///
    /// The default is `same-origin`.
    @discardableResult
    public func credentials(_ value: RequestCredentials) -> Self {
        credentials = value
        return self
    }
    
    /// The cache mode you want to use for the request.
    @discardableResult
    public func cache(_ value: String) -> Self {
        cache = value
        return self
    }
    
    /// The redirect mode to use: follow, error, or manual.
    ///
    /// The default is `follow`.
    @discardableResult
    public func redirect(_ value: RedirectMode) -> Self {
        redirect = value
        return self
    }
    
    /// A String specifying no-referrer, client, or a URL.
    ///
    /// The default is `about:client`.
    @discardableResult
    public func referrer(_ value: String) -> Self {
        referrer = value
        return self
    }
    
    /// Contains the subresource integrity value of the request
    /// (e.g., sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=).
    @discardableResult
    public func integrity(_ value: String) -> Self {
        integrity = value
        return self
    }
}
