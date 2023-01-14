//
//  StylesheetBuilder.swift
//  CSS
//
//  Created by Mihael Isaev on 30.12.2020.
//

public protocol RulesContent {
    var rulesContent: Rules.Item { get }
}

private struct EmptyContent: Rules.Content {
    let rulesContent: Rules.Item
}

struct _RulesContent: Rules.Content {
    let rulesContent: Rules.Item
}

@resultBuilder public struct Rules {
    public typealias Block = () -> RulesContent
    public typealias Content = RulesContent
    
    static var none: Rules.Content {
        EmptyContent(rulesContent: .none)
    }
    
    public enum Item {
        case none
        case raw(String)
        case rule(CSSRule)
        case keyframes(Keyframes)
        case media(MediaRule)
        case items([Item])
        case forEach(AnyForEach)
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
