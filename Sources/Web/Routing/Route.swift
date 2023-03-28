//
//  Route.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

public protocol AnyRoute: AnyObject {
    associatedtype P: AnyPageController
    
    var pageClass: P.Type { get }
    
    var rootPath: [String]? { get }
    var path: [String] { get set }
    var responder: any Responder { get set }
}

public final class Route<P: AnyPageController>: AnyRoute, CustomStringConvertible {
    public var pageClass: P.Type { P.self }
    
    public var rootPath: [String]?
    public var path: [String]
    public var responder: any Responder
    
    public var description: String {
        self.path.map { "\($0)" }.joined(separator: "/")
    }
    
    public init(
        path: [String],
        rootPath: [String]? = nil,
        responder: BasicResponder<P>
    ) {
        self.path = path
        self.rootPath = rootPath
        self.responder = responder
    }
}
