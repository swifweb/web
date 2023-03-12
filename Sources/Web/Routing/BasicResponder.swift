//
//  BasicResponder.swift
//
//
//  Created by Mihael Isaev on 23.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// A basic, closure-based `Responder`.
public struct BasicResponder: Responder {
    /// The stored responder closure.
    private let closure: (Request) throws -> PageController

    /// Create a new `BasicResponder`.
    ///
    ///     let notFound: Responder = BasicResponder { req in
    ///         let res = req.response(http: .init(status: .notFound))
    ///         return req.eventLoop.newSucceededFuture(result: res)
    ///     }
    ///
    /// - parameters:
    ///     - closure: Responder closure.
    public init(closure: @escaping (Request) throws -> PageController) {
        self.closure = closure
    }

    /// See `Responder`.
    public func respond(to request: Request) throws -> PageController? {
        try closure(request)
    }
}
