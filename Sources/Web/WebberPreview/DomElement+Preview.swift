//
//  DomElement+Preview.swift
//  Web
//
//  Created by Mihael Isaev on 24.02.2021.
//

import WebFoundation
import DOM
import CSS

extension BaseElement: WebPreviewRenderable, RenderBuilderContent {
    public var renderBuilderContent: Preview.Item { .item(self) }
}

extension DOMElement {
    var name: String { Self.name }
    
    // MARK: _PreviewRenderable
    
    public func renderPreview(singleQuotes: Bool) -> String {
        #if !arch(wasm32)
        if let s = self as? Stylesheet {
            var result = ""
            if s._rules.count > 0 {
                if singleQuotes {
                    result = "<style id='\(properties._id)'>"
                } else {
                    result = "<style id=\"\(properties._id)\">"
                }
                result += s._rules.map { $0.render() }.joined() + "</style>"
            }
            return result
        } else if let s = self as? Style {
            var result = ""
            if s.rules.count > 0 {
                if singleQuotes {
                    result = "<style id='\(properties._id)'>"
                } else {
                    result = "<style id=\"\(properties._id)\">"
                }
                result = s.rules.map { $0.render() }.joined() + "</style>"
            }
            return result
        }
        let style = properties.styles.map { $0.key + ":" + $0.value }.joined(separator: ";")
        #endif
        let previewElementName: String
        if self is PageController {
            previewElementName = "viewcontroller"
        } else {
            previewElementName = Self.name
        }
        var result = "<"
        result += "\(previewElementName)"
        if !properties.attributes.keys.contains("id") {
            if singleQuotes {
                result += " id='\(properties._id)'"
            } else {
                result += " id=\"\(properties._id)\""
            }
        }
        #if arch(wasm32)
        if properties.attributes.keys.contains("class") {
            properties.attributes["class"] = (properties.attributes["class"] ?? "") + " " + properties._classes.joined(separator: " ")
        } else {
            properties.attributes["class"] = properties._classes.joined(separator: " ")
        }
        #else
        if style.count > 0 {
            if singleQuotes {
                result += " style='\(style)'"
            } else {
                result += " style=\"\(style)\""
            }
        }
        #endif
        properties.attributes.forEach { key, value in
            result += " " + key
            if value.count > 0 {
                if singleQuotes {
                    result += "='" + value + "'"
                } else {
                    result += "=\"" + value + "\""
                }
            }
        }
        result += ">"
        if let s = self as? BaseContentElementable, s.innerText.count > 0 {
            result += s.innerText
        }
        properties.subElements.forEach {
            result.append($0.renderPreview(singleQuotes: singleQuotes))
        }
        result.append("</\(previewElementName)>")
        return result
    }
}
