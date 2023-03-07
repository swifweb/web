//
//  Route.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

public final class Route: CustomStringConvertible {
    public var path: [String]
    public var responder: Responder
    
    public var description: String {
        self.path.map { "\($0)" }.joined(separator: "/")
    }
    
    public init(
        path: [String],
        responder: Responder
    ) {
        self.path = path
        self.responder = responder
    }
}
