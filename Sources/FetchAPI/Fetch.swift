//
//  Fetch.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 09.03.2021.
//

import Foundation
import WebFoundation

public final class Fetch {
    private init (_ value: JSValue, _ options: RequestOptions? = nil, _ handler: @escaping (Result<Response, Error>) -> Void) {
        guard let jsPromise = JSObject.global.fetch.function?.callAsFunction(value, options?.jsValue).object else {
            handler(.failure(JSError(message: "`Fetch` is unavailabe")))
            return
        }
        JSPromise(jsPromise)?.then(success: { result in
            handler(.success(.init(result)))
            return JSValue.undefined
        }, failure: { error in
            handler(.failure(error))
            return JSValue.undefined
        })
    }
    
    @discardableResult
    public convenience init (_ url: URLValue, _ options: RequestOptions? = nil, _ handler: @escaping (Result<Response, Error>) -> Void) {
        self.init(url.urlValue.jsValue(), options, handler)
    }
    
    @discardableResult
    public convenience init (_ request: Request, _ options: RequestOptions? = nil, _ handler: @escaping (Result<Response, Error>) -> Void) {
        self.init(request.jsValue, options, handler)
    }
}
