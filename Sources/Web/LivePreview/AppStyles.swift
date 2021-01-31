//
//  AppStyles.swift
//  Web
//
//  Created by Mihael Isaev on 31.01.2021.
//

#if os(macOS) && canImport(SwiftUI) && DEBUG && !arch(wasm32)
public enum AppStyles: _PreviewRenderable, RenderBuilderContent {
    case all, enabled, disabled, ids([Id]), id(Id), classes([Class]), `class`(Class)
    
    public var renderBuilderContent: RenderBuilder.Item { .item(self) }
    
    func renderPreview() -> String {
        guard previewMode == .static else { return "" }
        WebApp.shared._previewStart()
        let styles: [Stylesheet]
        switch self {
        case .all: styles = WebApp.shared.stylesheets
        case .disabled: styles = WebApp.shared.stylesheets.filter { $0._disabled }
        case .enabled: styles = WebApp.shared.stylesheets.filter { !$0._disabled }
        case .ids(let ids): styles = WebApp.shared.stylesheets.filter { ids.map { $0.name }.contains($0._id) }
        case .id(let id): styles = WebApp.shared.stylesheets.filter { $0._id == id.name }
        case .classes(let classes): styles = WebApp.shared.stylesheets.filter { Set(classes.map { $0.name }).isSubset(of: Set($0._classes)) }
        case .class(let `class`): styles = WebApp.shared.stylesheets.filter { $0._classes.contains(`class`.name) }
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
