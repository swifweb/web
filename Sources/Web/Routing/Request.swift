//
//  Request.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

public typealias PageRequest = Request

public final class Request: CustomStringConvertible {
    public let application: WebApp

    /// The Path used on this request.
    public var path: String
    
    /// The Query used on this request.
    public var search: String
    
    /// The Hash used on this request.
    public var hash: String
    
    // MARK: Metadata
    
    /// Route object we found for this request.
    /// This holds metadata that can be used for (for example) Metrics.
    ///
    ///     req.route?.description // "GET /hello/:name"
    ///
    public var route: Route?

    // MARK: Content

    private struct _URLQueryContainer: URLQueryContainer {
        let request: Request
        
        init (request: Request) {
            self.request = request
        }

        func decode<D: Decodable>(_ decodable: D.Type, using decoder: URLQueryDecoder) throws -> D {
            var search = request.search
            while search.starts(with: "?") {
                search = String(search.dropFirst())
            }
            return try decoder.decode(D.self, from: search)
        }

        func encode<E: Encodable>(_ encodable: E, using encoder: URLQueryEncoder) throws {
            try encoder.encode(encodable, to: &self.request.search)
        }
    }
    
    public var query: URLQueryContainer {
        get { _URLQueryContainer(request: self) }
        set {
            // ignore since Request is a reference type
        }
    }

    /// See `CustomStringConvertible`
    public var description: String {
        return "n/a"
    }
    
    public var parameters: Parameters

    public init(application: WebApp, path: String, search: String = "", hash: String = "") {
        self.application = application
        self.parameters = .init()
        self.path = path
        self.search = search
        self.hash = hash
    }
}
