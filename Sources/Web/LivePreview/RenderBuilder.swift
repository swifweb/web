//
//  RenderBuilder.swift
//  Web
//
//  Created by Mihael Isaev on 27.01.2021.
//

public protocol PreviewRenderable {}

protocol _PreviewRenderable: PreviewRenderable {
    func renderPreview() -> String
}

public protocol RenderBuilderContent {
    var renderBuilderContent: RenderBuilder.Item { get }
}

struct _RenderBuilderContent: RenderBuilder.Content {
    let renderBuilderContent: RenderBuilder.Item
}

@_functionBuilder public struct RenderBuilder {
    public typealias Block = () -> RenderBuilderContent
    public typealias Content = RenderBuilderContent
    
    public enum Item {
        case none
        case item(PreviewRenderable)
        case items([Item])
    }

    public static func buildBlock() -> Content {
        _RenderBuilderContent(renderBuilderContent: .none)
    }

    public static func buildBlock(_ attrs: Content...) -> Content {
        buildBlock(attrs)
    }

    public static func buildBlock(_ attrs: [Content]) -> Content {
        _RenderBuilderContent(renderBuilderContent: .items(attrs.map { $0.renderBuilderContent }))
    }

    public static func buildIf(_ content: Content?) -> Content {
        guard let content = content else { return _RenderBuilderContent(renderBuilderContent: .none) }
        return _RenderBuilderContent(renderBuilderContent: .items([content.renderBuilderContent]))
    }

    public static func buildEither(first: Content) -> Content {
        _RenderBuilderContent(renderBuilderContent: .items([first.renderBuilderContent]))
    }

    public static func buildEither(second: Content) -> Content {
        _RenderBuilderContent(renderBuilderContent: .items([second.renderBuilderContent]))
    }
}
