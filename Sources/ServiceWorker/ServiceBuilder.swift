//
//  ServiceBuilder.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

import Foundation

public protocol ServiceBuilderContent {
    var serviceBuilderContent: ServiceBuilder.Item { get }
}

struct _ServiceContent: ServiceBuilder.Content {
    let serviceBuilderContent: ServiceBuilder.Item
}

@resultBuilder public struct ServiceBuilder {
    public typealias Block = () -> ServiceBuilderContent
    public typealias Content = ServiceBuilderContent
    
    public enum Item {
        case none
        case lifecycle(Lifecycle)
        case manifest(Manifest)
        case items([Item])
    }

    public static func buildBlock() -> Content {
        _ServiceContent(serviceBuilderContent: .none)
    }

    public static func buildBlock(_ attrs: Content...) -> Content {
        buildBlock(attrs)
    }

    public static func buildBlock(_ attrs: [Content]) -> Content {
        _ServiceContent(serviceBuilderContent: .items(attrs.map { $0.serviceBuilderContent }))
    }

    public static func buildIf(_ content: Content?) -> Content {
        guard let content = content else { return _ServiceContent(serviceBuilderContent: .none) }
        return _ServiceContent(serviceBuilderContent: .items([content.serviceBuilderContent]))
    }

    public static func buildEither(first: Content) -> Content {
        _ServiceContent(serviceBuilderContent: .items([first.serviceBuilderContent]))
    }

    public static func buildEither(second: Content) -> Content {
        _ServiceContent(serviceBuilderContent: .items([second.serviceBuilderContent]))
    }
}
