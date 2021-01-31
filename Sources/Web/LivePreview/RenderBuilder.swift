//
//  RenderBuilder.swift
//  Web
//
//  Created by Mihael Isaev on 27.01.2021.
//

#if os(macOS) && canImport(SwiftUI) && DEBUG && !arch(wasm32)
public enum AppStyles: _PreviewRenderable, RenderBuilderContent {
    case all, enabled, disabled, ids([String]), id(String)
    
    public var renderBuilderContent: RenderBuilder.Item { .item(self) }
    
    func renderPreview() -> String {
        guard previewMode == .static else { return "" }
        WebApp.shared._previewStart()
        let styles: [Stylesheet]
        switch self {
        case .all: styles = WebApp.shared.stylesheets
        case .disabled: styles = WebApp.shared.stylesheets.filter { $0._disabled }
        case .enabled: styles = WebApp.shared.stylesheets.filter { !$0._disabled }
        case .ids(let ids): styles = WebApp.shared.stylesheets.filter { ids.contains($0._id) }
        case .id(let id): styles = WebApp.shared.stylesheets.filter { $0._id == id }
        }
        var result = ""
        for style in styles {
            if previewMode == .dynamic {
                style.processRules()
            } else {
                guard style._rules.count > 0 else { continue }
                result.append("<style id=\"\(style._id)\">" + style._rules.map { $0.render() }.joined() + "</style>")
            }
        }
        return result
    }
}
#endif
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
