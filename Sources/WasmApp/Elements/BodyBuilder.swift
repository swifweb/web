//
//  BodyBuilder.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

public protocol BodyBuilderContent {
    var bodyBuilderContent: BodyBuilderItem { get }
}

public enum BodyBuilderItem {
    case none
    case elements([AnyElement])
    case items([BodyBuilderItem])
}

struct EBContent: BodyBuilderContent {
    let bodyBuilderContent: BodyBuilderItem
}

@_functionBuilder public struct BodyBuilder {
    public typealias Content = BodyBuilderContent
    public typealias Block = () -> BodyBuilderContent
    
    public static func buildBlock() -> Content {
        EBContent(bodyBuilderContent: .none)
    }
    
    public static func buildBlock(_ attrs: BodyBuilderContent...) -> Content {
        buildBlock(attrs)
    }
    
    public static func buildBlock(_ attrs: [BodyBuilderContent]) -> Content {
        EBContent(bodyBuilderContent: .items(attrs.map { $0.bodyBuilderContent }))
    }
    
    public static func buildIf(_ content: BodyBuilderContent?) -> Content {
        guard let content = content else { return EBContent(bodyBuilderContent: .none) }
        return EBContent(bodyBuilderContent: .items([content.bodyBuilderContent]))
    }
    
    public static func buildEither(first: BodyBuilderContent) -> Content {
        EBContent(bodyBuilderContent: .items([first.bodyBuilderContent]))
    }

    public static func buildEither(second: BodyBuilderContent) -> Content {
        EBContent(bodyBuilderContent: .items([second.bodyBuilderContent]))
    }
}
