//
//  DOM.swift
//  DOM
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

public protocol DOMContent {
    var domContentItem: DOMItem { get }
}

public enum DOMItem {
    case none
    case elements([DOMElement])
    case items([DOMItem])
    case print(DOMPrint)
}

private struct EmptyContent: DOMContent {
    let domContentItem: DOMItem
}

extension String: DOMContent {
    public var domContentItem: DOMItem {
        let div = Div()
        div.innerHTML = self
        return .elements([div])
    }
}

/// Use it as follows
///
/// ```
/// @DOM override var body: DOM.Content {
///     Div("Hello world")
/// }
/// ````
///
@resultBuilder public struct DOM {
    public typealias Content = DOMContent
    public typealias Block = () -> Content
    
    static var none: DOMContent {
        EmptyContent(domContentItem: .none)
    }
    
    public static func buildBlock() -> Content { none }
    
    public static func buildBlock(_ attrs: Content...) -> Content {
        buildBlock(attrs)
    }
    
    public static func buildBlock(_ attrs: [Content]) -> Content {
        EmptyContent(domContentItem: .items(attrs.map { $0.domContentItem }))
    }
    
    public static func buildIf(_ content: Content?) -> Content {
        guard let content = content else { return EmptyContent(domContentItem: .none) }
        return EmptyContent(domContentItem: .items([content.domContentItem]))
    }
    
    public static func buildEither(first: Content) -> Content {
        EmptyContent(domContentItem: .items([first.domContentItem]))
    }

    public static func buildEither(second: Content) -> Content {
        EmptyContent(domContentItem: .items([second.domContentItem]))
    }
}
extension Array: DOMContent where Element: DOMElement {
    public var domContentItem: DOMItem { .elements(self) }
}
extension Optional: DOMContent where Wrapped: DOMElement {
    public var domContentItem: DOMItem {
        switch self {
        case .none: return .none
        case .some(let value): return .elements([value])
        }
    }
}

public struct DOMPrint: DOMContent {
    public var domContentItem: DOMItem { .print(self) }
    
    let items: [ConvertibleToJSValue]
    
    public init (_ items: [ConvertibleToJSValue]) {
        self.items = items
    }
    
    public init (_ items: ConvertibleToJSValue...) {
        self.items = items
    }
}

extension DOM {
    public static func print(_ items: ConvertibleToJSValue...) -> DOMPrint {
        .init(items)
    }
}
