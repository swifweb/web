//
//  URLQueryContainer.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// Helper for encoding and decoding data from an HTTP request query string.
///
/// See `Request.query` for more information.
public protocol URLQueryContainer {
    func decode<D: Decodable>(_ decodable: D.Type, using decoder: URLQueryDecoder) throws -> D

    mutating func encode<E: Encodable>(_ encodable: E, using encoder: URLQueryEncoder) throws
}

extension URLQueryContainer {
    private func configuredEncoder() -> URLQueryEncoder{
        URLEncodedFormEncoder()
    }
    
    private func configuredDecoder() -> URLQueryDecoder{
        URLEncodedFormDecoder()
    }
    
    // MARK: Content

    /// Serializes a `Content` type to this HTTP request query string.
    ///
    ///     let flags: Flags ...
    ///     try req.query.encode(flags)
    ///
    /// A `MediaType.urlEncodedForm` encoder will be used.
    ///
    /// - parameters:
    ///     - content: `Content` type to encode to this HTTP message.
    /// - throws: Any errors making the decoder for this media type or serializing the query string.
    public mutating func encode<C: Codable>(_ content: C) throws {
        try self.encode(content, using: self.configuredEncoder())
    }

    /// Parses a `Content` type from this HTTP request query string.
    ///
    ///     let flags = try req.query.decode(Flags.self)
    ///     print(flags) // Flags
    ///
    /// A `MediaType.urlEncodedForm` decoder will be used.
    ///
    /// - parameters:
    ///     - content: `Content` type to decode from this HTTP message.
    /// - returns: Instance of the `Decodable` type.
    /// - throws: Any errors making the decoder for this media type or parsing the query string.
    public func decode<C: Codable>(_ content: C.Type) throws -> C {
        try decode(C.self, using: configuredDecoder())
    }

    /// Serializes an `Encodable` type to this HTTP request query string.
    ///
    ///     let flags: Flags ...
    ///     try req.query.encode(flags)
    ///
    /// A `MediaType.urlEncodedForm` encoder will be used.
    ///
    /// - parameters:
    ///     - encodable: `Encodable` type to encode to this HTTP message.
    /// - throws: Any errors making the decoder for this media type or serializing the query string.
    public mutating func encode<E: Encodable>(_ encodable: E) throws {
        try encode(encodable, using: configuredEncoder())
    }

    /// Parses a `Decodable` type from this HTTP request query string.
    ///
    ///     let flags = try req.query.decode(Flags.self)
    ///     print(flags) // Flags
    ///
    /// A `MediaType.urlEncodedForm` decoder will be used.
    ///
    /// - parameters:
    ///     - decodable: `Decodable` type to decode from this HTTP message.
    /// - returns: Instance of the `Decodable` type.
    /// - throws: Any errors making the decoder for this media type or parsing the query string.
    public func decode<D: Decodable>(_ decodable: D.Type) throws -> D {
        try decode(D.self, using: configuredDecoder())
    }

    // MARK: Single Value

    /// Fetches a single `Decodable` value at the supplied key-path from this HTTP request's query string.
    ///
    /// Note: This is a non-throwing subscript convenience method for `get(_:at:)`.
    ///
    ///     let name: String? = req.query["user", "name"]
    ///     print(name) /// String?
    ///
    /// - parameters:
    ///     - keyPath: One or more key path components to the desired value.
    /// - returns: Decoded `Decodable` value.
    public subscript<D: Decodable>(_ keyPath: CodingKeyRepresentable...) -> D? {
        self[D.self, at: keyPath]
    }

    /// Fetches a single `Decodable` value at the supplied key-path from this HTTP request's query string.
    ///
    /// Note: This is a non-throwing subscript convenience method for `get(_:at:)`.
    ///
    ///     let name = req.query[String.self, at: "user", "name"]
    ///     print(name) /// String?
    ///
    /// - parameters:
    ///     - type: The `Decodable` value type to decode.
    ///     - keyPath: One or more key path components to the desired value.
    /// - returns: Decoded `Decodable` value.
    public subscript<D: Decodable>(_ type: D.Type, at keyPath: CodingKeyRepresentable...) -> D? {
        self[D.self, at: keyPath]
    }

    /// Fetches a single `Decodable` value at the supplied key-path from this HTTP request's query string.
    ///
    /// Note: This is a non-throwing subscript convenience method for `get(_:at:)`. This is the non-variadic version.
    ///
    ///     let name = req.query[String.self, at: "user", "name"]
    ///     print(name) /// String?
    ///
    /// - parameters:
    ///     - type: The `Decodable` value type to decode.
    ///     - keyPath: One or more key path components to the desired value.
    /// - returns: Decoded `Decodable` value.
    public subscript<D: Decodable>(_ type: D.Type, at keyPath: [CodingKeyRepresentable]) -> D? {
        try? get(type, at: keyPath)
    }

    /// Fetches a single `Decodable` value at the supplied key-path from this HTTP request's query string.
    ///
    ///     let name = try req.query.get(String.self, at: "user", "name")
    ///     print(name) /// String
    ///
    /// - parameters:
    ///     - type: The `Decodable` value type to decode.
    ///     - keyPath: One or more key path components to the desired value.
    /// - returns: Decoded `Decodable` value.
    public func get<D: Decodable>(_ type: D.Type = D.self, at keyPath: CodingKeyRepresentable...) throws -> D {
        try get(type, at: keyPath)
    }

    /// Fetches a single `Decodable` value at the supplied key-path from this HTTP request's query string.
    ///
    /// Note: This is the non-variadic version.
    ///
    ///     let name = try req.query.get(String.self, at: "user", "name")
    ///     print(name) /// String
    ///
    /// - parameters:
    ///     - type: The `Decodable` value type to decode.
    ///     - keyPath: One or more key path components to the desired value.
    /// - returns: Decoded `Decodable` value.
    public func get<D: Decodable>(_ type: D.Type = D.self, at keyPath: [CodingKeyRepresentable]) throws -> D {
        try self.decode(SingleValueDecoder.self).get(at: keyPath.map { $0.codingKey })
    }
}
