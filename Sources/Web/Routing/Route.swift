//
//  Route.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

public final class Route: CustomStringConvertible {
    public var rootPath: [String]?
    public var path: [String]
    public var responder: Responder
    
    public var description: String {
        self.path.map { "\($0)" }.joined(separator: "/")
    }
    
    public init(
        path: [String],
        rootPath: [String]? = nil,
        responder: Responder
    ) {
        self.path = path
        self.rootPath = rootPath
        self.responder = responder
    }
}
