//
//  WebPreview.swift
//  Web
//
//  Created by Mihael Isaev on 12.03.2021.
//

import Foundation
import WebFoundation

extension Language: RenderBuilderContent {
    public var renderBuilderContent: Preview.Item { .language(self) }
}

open class WebPreview {
    @available(*, deprecated, message: "🧨 This variable is deprecated and not working. Please switch to `Language.en` in the @Preview content body declaration.")
    open class var language: Language { .en }
    @available(*, deprecated, message: "🧨 This variable is deprecated and not working. Please switch to `Title(\"\")` in the @Preview content body declaration.")
    open class var title: String { "" }
    @available(*, deprecated, message: "🧨 This variable is deprecated and not working. Please switch to `Size(640, 480)` in the @Preview content body declaration.")
    open class var width: UInt { 0 }
    @available(*, deprecated, message: "🧨 This variable is deprecated and not working. Please switch to `Size(640, 480)` in the @Preview content body declaration.")
    open class var height: UInt { 0 }
    
    @Preview open class var content: Preview.Content { _RenderBuilderContent(renderBuilderContent: .none) }
    
    public struct Title: RenderBuilderContent {
        public var renderBuilderContent: Preview.Item { .title(self) }
        
        let title: String
        
        public init (_ title: String) {
            self.title = title
        }
    }
    
    public struct Size: RenderBuilderContent {
        public var renderBuilderContent: Preview.Item { .size(self) }
        
        public let width: UInt
        public let height: UInt
        
        public init (_ width: UInt, _ height: UInt) {
            self.width = width
            self.height = height
        }
    }
    
    #if os(macOS)
    class PreviewData: NSObject {
        let title: String
        let width: UInt
        let height: UInt
        let html: String
        
        init (
            title: String,
            width: UInt,
            height: UInt,
            html: String
        ) {
            self.title = title
            self.width = width
            self.height = height
            self.html = html
        }
    }
    #else
    class PreviewData {
        let title: String
        let width: UInt
        let height: UInt
        let html: String
        
        init (
            title: String,
            width: UInt,
            height: UInt,
            html: String
        ) {
            self.title = title
            self.width = width
            self.height = height
            self.html = html
        }
    }
    #endif
    
    #if os(macOS)
    @objc class var result: PreviewData { _result }
    #else
    class var result: PreviewData { _result }
    #endif
    
    private class var _result: PreviewData {
        var title: String = ""
        var width: UInt = 0
        var height: UInt = 0
        
        var items: [WebPreviewRenderable] = []
        func parseRenderBuilderLanguage(_ item: Preview.Item) {
            switch item {
            case .language(let v):
                Localization.shared.defaultLanguage = v
                Localization.shared.currentLanguage = v
            case .items(let v):
                v.forEach { parseRenderBuilderLanguage($0) }
            default: break
            }
        }
        func parseRenderBuilderItem(_ item: Preview.Item) {
            switch item {
            case .language:
                break
            case .title(let v):
                title = v.title
            case .size(let size):
                width = size.width
                height = size.height
            case .items(let v):
                v.forEach { parseRenderBuilderItem($0) }
            case .item(let v):
                items.append(v)
            case .none:
                break
            }
        }
        parseRenderBuilderLanguage(content.renderBuilderContent)
        parseRenderBuilderItem(content.renderBuilderContent)
        let html: String = items.map { $0.renderPreview(singleQuotes: false) }.joined()
        
        return PreviewData(
            title: title,
            width: width,
            height: height,
            html: html
        )
    }
}
