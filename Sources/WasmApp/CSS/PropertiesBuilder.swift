//
//  PropertiesBuilder.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

public protocol PropertiesContent {
    var propertiesContent: Properties.Item { get }
}

struct _PropertiesContent: Properties.Content {
    let propertiesContent: Properties.Item
}

@_functionBuilder public struct Properties {
    public typealias Block = () -> PropertiesContent
    public typealias Content = PropertiesContent
    
    public enum Item {
        case none
        case property(AnyProperty)
        case items([Item])
    }

    public static func buildBlock() -> Content {
        _PropertiesContent(propertiesContent: .none)
    }

    public static func buildBlock(_ attrs: Content...) -> Content {
        buildBlock(attrs)
    }

    public static func buildBlock(_ attrs: [Content]) -> Content {
        _PropertiesContent(propertiesContent: .items(attrs.map { $0.propertiesContent }))
    }

    public static func buildIf(_ content: Content?) -> Content {
        guard let content = content else { return _PropertiesContent(propertiesContent: .none) }
        return _PropertiesContent(propertiesContent: .items([content.propertiesContent]))
    }

    public static func buildEither(first: Content) -> Content {
        _PropertiesContent(propertiesContent: .items([first.propertiesContent]))
    }

    public static func buildEither(second: Content) -> Content {
        _PropertiesContent(propertiesContent: .items([second.propertiesContent]))
    }
}
