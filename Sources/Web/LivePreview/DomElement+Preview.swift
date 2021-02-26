//
//  DomElement+Preview.swift
//  Web
//
//  Created by Mihael Isaev on 24.02.2021.
//

import DOM
import CSS

extension BaseElement: PreviewRenderable, RenderBuilderContent {
    public var renderBuilderContent: RenderBuilder.Item { .item(self) }
}

extension DOMElement {
    var name: String { Self.name }
    
    // MARK: _PreviewRenderable
    
    func renderPreview() -> String {
        #if !arch(wasm32)
        if let s = self as? Stylesheet {
            guard previewMode == .static else { return "" }
            var result = ""
            if s._rules.count > 0 {
                result = "<style id=\"\(properties._id)\">" + s._rules.map { $0.render() }.joined() + "</style>"
            }
            return result
        } else if let s = self as? Style {
            guard previewMode == .static else { return "" }
            var result = ""
            if s.rules.count > 0 {
                result = "<style id=\"\(properties._id)\">" + s.rules.map { $0.render() }.joined() + "</style>"
            }
            return result
        }
        let style = properties.styles.map { $0.key + ":" + $0.value }.joined(separator: ";")
        var result = "<\(Self.name) id=\"\(properties._id)\""
        if style.count > 0 {
            result += " style=\"\(style)\""
        }
        if previewMode == .static {
            properties.attributes.forEach { key, value in
                result += " " + key
                if value.count > 0 {
                    result += "=\"" + value + "\""
                }
            }
        }
        result += ">"
        if previewMode == .static,
           let s = self as? BaseContentElementable,
           s.innerText.count > 0 {
            result += s.innerText
        }
        properties.subElements.forEach {
            guard let v = $0 as? BaseElement else { return }
            result.append(v.renderPreview())
        }
        result.append("</\(Self.name)>")
        return result
        #else
        return ""
        #endif
    }
}
