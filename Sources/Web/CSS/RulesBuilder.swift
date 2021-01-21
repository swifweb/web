//
//  StylesheetBuilder.swift
//  Web
//
//  Created by Mihael Isaev on 30.12.2020.
//

public protocol RulesContent {
    var rulesContent: Rules.Item { get }
}

struct _RulesContent: Rules.Content {
    let rulesContent: Rules.Item
}

@_functionBuilder public struct Rules {
    public typealias Block = () -> RulesContent
    public typealias Content = RulesContent
    
    public enum Item {
        case none
        case rule(CSSRule)
        case items([Item])
    }

    public static func buildBlock() -> Content {
        _RulesContent(rulesContent: .none)
    }

    public static func buildBlock(_ attrs: Content...) -> Content {
        buildBlock(attrs)
    }

    public static func buildBlock(_ attrs: [Content]) -> Content {
        _RulesContent(rulesContent: .items(attrs.map { $0.rulesContent }))
    }

    public static func buildIf(_ content: Content?) -> Content {
        guard let content = content else { return _RulesContent(rulesContent: .none) }
        return _RulesContent(rulesContent: .items([content.rulesContent]))
    }

    public static func buildEither(first: Content) -> Content {
        _RulesContent(rulesContent: .items([first.rulesContent]))
    }

    public static func buildEither(second: Content) -> Content {
        _RulesContent(rulesContent: .items([second.rulesContent]))
    }
}
