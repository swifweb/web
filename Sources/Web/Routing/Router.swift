//
//  Router.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// An object that can quickly lookup previously registered routes.
///
/// See `TrieRouter` for concrete implementation.
public protocol Router {
    /// Type of value stored in routes. This will be returned by the router.
    associatedtype Output
    
    /// Registers a new `Output` to the `Router` at a given path.
    ///
    ///  - parameters:
    ///     - output: Output to register.
    ///     - path: Path to register output at.
    ///
    mutating func register(_ output: Output, at path: [PathComponent])
    
    /// Fetches output for a specific route.
    ///
    /// `PathComponent.parameter` values will be stored in the supplied `Parameters`
    /// container during routing.
    ///
    /// If no matching route is found, `nil` is returned.
    ///
    /// - parameters:
    ///     - path: Raw path segments.
    ///     - parameters: Will collect dynamic parameter values.
    /// - returns: Output of matching route, if found.
    func route(path: [String], parameters: inout Parameters) -> Output?
}
