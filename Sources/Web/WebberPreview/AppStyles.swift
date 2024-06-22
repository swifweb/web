//
//  AppStyles.swift
//  Web
//
//  Created by Mihael Isaev on 31.01.2021.
//

import WebFoundation
import CSS

public enum AppStyles: WebPreviewRenderable, RenderBuilderContent {
    case all, enabled, disabled, ids([Id]), id(Id), classes([Class]), `class`(Class)
    
    public var renderBuilderContent: Preview.Item { .item(self) }
    
    public func renderPreview(singleQuotes: Bool) -> String {
        #if WEBPREVIEW
        WebApp.shared._previewStart()
        let styles: [Stylesheet]
        switch self {
        case .all: styles = WebApp.shared.stylesheets
        case .disabled: styles = WebApp.shared.stylesheets.filter { $0._disabled }
        case .enabled: styles = WebApp.shared.stylesheets.filter { !$0._disabled }
        case .ids(let ids): styles = WebApp.shared.stylesheets.filter { ids.map { $0.name }.contains($0.properties._id) }
        case .id(let id): styles = WebApp.shared.stylesheets.filter { $0.properties._id == id.name }
        case .classes(let classes): styles = WebApp.shared.stylesheets.filter { Set(classes.map { $0.names }.flatMap { $0 }).isSubset(of: Set($0.properties._classes)) }
        case .class(let `class`): styles = WebApp.shared.stylesheets.filter { Set(`class`.names).isSubset(of: Set($0.properties._classes)) }
        }
        var result = ""
        for style in styles {
            guard
                style._rules.count > 0 ||
                style._keyframes.count > 0 ||
                style._medias.count > 0
            else { continue }
            if singleQuotes {
                result.append("<style id='\(style.properties._id)'>")
            } else {
                result.append("<style id=\"\(style.properties._id)\">")
            }
            result.append(style._rules.map { $0.render() }.joined())
            result.append(style._keyframes.map { $0.render() }.joined())
            result.append(style._medias.map { $0.render() }.joined())
            result.append("</style>")
        }
        return result
        #else
        return ""
        #endif
    }
}
