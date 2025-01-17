//
//  WebPreviewRenderable.swift
//  Web
//
//  Created by Mihael Isaev on 31.01.2021.
//

public protocol WebPreviewRenderable {
    func renderPreview(singleQuotes: Bool) -> String
}
extension WebPreviewRenderable {
    public func renderPreview() -> String {
        renderPreview(singleQuotes: false)
    }
}
