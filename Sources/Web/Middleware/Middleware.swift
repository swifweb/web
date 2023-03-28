//
//  Middleware.swift
//
//
//  Created by Mihael Isaev on 23.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// `Middleware` is placed between the server and your router. It is capable of
/// mutating both incoming requests and outgoing responses. `Middleware` can choose
/// to pass requests on to the next `Middleware` in a chain, or they can short circuit and
/// return a custom `Response` if desired.
public protocol Middleware {
    /// Called with each `Request` that passes through this middleware.
    /// - parameters:
    ///     - request: The incoming `Request`.
    ///     - next: Next `Responder` in the chain, potentially another middleware or the main router.
    /// - returns: An asynchronous `Response`.
    func respond(to request: Request, chainingTo next: any Responder) -> PageController
}

extension Array where Element == Middleware {
    /// Wraps a `Responder` in an array of `Middleware` creating a new `Responder`.
    /// - note: The array of middleware must be `[Middleware]` not `[M] where M: Middleware`.
    public func makeResponder(chainingTo responder: any Responder) -> any Responder {
        var responder = responder
        for middleware in reversed() {
            responder = middleware.makeResponder(chainingTo: responder)
        }
        return responder
    }
}

public extension Middleware {
    /// Wraps a `Responder` in a single `Middleware` creating a new `Responder`.
    func makeResponder(chainingTo responder: any Responder) -> any Responder {
        HTTPMiddlewareResponder(middleware: self, responder: responder)
    }
}

private struct HTTPMiddlewareResponder: Responder {
    var middleware: Middleware
    var responder: any Responder
    
    init(middleware: Middleware, responder: any Responder) {
        self.middleware = middleware
        self.responder = responder
    }
    
    func respond(to request: Request) throws -> AnyPageController? {
        middleware.respond(to: request, chainingTo: responder)
    }
}
