//
//  DOM.swift
//  DOM
//
//  Created by Mihael Isaev on 29.11.2020.
//

import FoundationEssentials

public protocol DOMContent {
    @MainActor
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

    @MainActor
    init(domContentItem: DOMItem) {
        self.domContentItem = domContentItem
    }
}

extension String: DOMContent {
    @MainActor
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
    public static var isForCrawler: Bool { JSObject.global.isCrawlServer.boolean ?? false }

    public typealias Content = DOMContent
    public typealias Block = @MainActor () -> Content
    
    @MainActor
    static var none: DOMContent {
        EmptyContent(domContentItem: .none)
    }
    
    @MainActor
    public static func buildBlock() -> Content { none }
    
    @MainActor
    public static func buildBlock(_ attrs: Content...) -> Content {
        buildBlock(attrs)
    }
    
    @MainActor
    public static func buildBlock(_ attrs: [Content]) -> Content {
        EmptyContent(domContentItem: .items(attrs.map { $0.domContentItem }))
    }
    
    @MainActor
    public static func buildIf(_ content: Content?) -> Content {
        guard let content = content else { return EmptyContent(domContentItem: .none) }
        return EmptyContent(domContentItem: .items([content.domContentItem]))
    }
    
    @MainActor
    public static func buildEither(first: Content) -> Content {
        EmptyContent(domContentItem: .items([first.domContentItem]))
    }

    @MainActor
    public static func buildEither(second: Content) -> Content {
        EmptyContent(domContentItem: .items([second.domContentItem]))
    }
}
extension Array: DOMContent where Element: DOMElement {
    @MainActor
    public var domContentItem: DOMItem { .elements(self) }
}
extension Optional: DOMContent where Wrapped: DOMElement {
    @MainActor
    public var domContentItem: DOMItem {
        switch self {
        case .none: return .none
        case .some(let value): return .elements([value])
        }
    }
}

public struct DOMPrint: DOMContent {
    @MainActor
    public var domContentItem: DOMItem { .print(self) }
    
    public let items: [ConvertibleToJSValue]
    
    public init (_ items: [ConvertibleToJSValue]) {
        self.items = items
    }
    
    public init (_ items: ConvertibleToJSValue...) {
        self.items = items
    }
}

extension DOM {
    @MainActor
    public static func print(_ items: ConvertibleToJSValue...) -> DOMPrint {
        .init(items)
    }
}
