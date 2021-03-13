//
//  WebPreview.swift
//  Web
//
//  Created by Mihael Isaev on 12.03.2021.
//

import Foundation
import WebFoundation

open class WebPreview {
    open class var language: Language { .en }
    open class var title: String { "" }
    open class var width: UInt { 0 }
    open class var height: UInt { 0 }
    
    @Preview open class var content: Preview.Content { _RenderBuilderContent(renderBuilderContent: .none) }
    
    @objc class var html: String {
        var items: [WebPreviewRenderable] = []
        func parseRenderBuilderItem(_ item: Preview.Item) {
            switch item {
            case .items(let v): v.forEach { parseRenderBuilderItem($0) }
            case .item(let v): items.append(v)
            case .none: break
            }
        }
        parseRenderBuilderItem(content.renderBuilderContent)
        return items.map { $0.renderPreview() }.joined()
    }
}
