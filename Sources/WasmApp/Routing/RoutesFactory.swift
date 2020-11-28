//
//  RoutesFactory.swift
//  WasmApp
//
//  Created by Mihael Isaev on 23.11.2020.
//

import Foundation

public protocol RoutesFactoryContent {
    var routesFactoryContent: RoutesFactory.Item { get }
}

@_functionBuilder public struct RoutesFactory {
    public enum Item {
        case none
        case group(Routes.Group)
        case endpoint(AnyRoutesEndpoint)
        case items([Self])
    }
    
    struct Content: RoutesFactoryContent {
        let routesFactoryContent: Item
    }
    
    public typealias Result = RoutesFactoryContent
    public typealias Block = () -> Result

    public static func buildBlock() -> Result {
        Content(routesFactoryContent: .none)
    }

    public static func buildBlock(_ attrs: Result...) -> Result {
        buildBlock(attrs)
    }

    public static func buildBlock(_ attrs: [Result]) -> Result {
        Content(routesFactoryContent: .items(attrs.map { $0.routesFactoryContent }))
    }

    public static func buildIf(_ content: Result?) -> Result {
        guard let content = content else { return Content(routesFactoryContent: .none) }
        return Content(routesFactoryContent: .items([content.routesFactoryContent]))
    }

    public static func buildEither(first: Result) -> Result {
        Content(routesFactoryContent: .items([first.routesFactoryContent]))
    }

    public static func buildEither(second: Result) -> Result {
        Content(routesFactoryContent: .items([second.routesFactoryContent]))
    }
}
