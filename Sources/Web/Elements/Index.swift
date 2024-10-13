//
//  Index.swift
//  web
//
//  Created by Mihael Isaev on 13.10.2024.
//

import Foundation
import WebFoundation

/// Static information for `index.html` file
/// Should contain title, description, meta, and other information
open class Index: Codable, AppBuilderContent {
    public var appBuilderContent: AppBuilder.Item { .index(self) }
    
    public init() {}
    
    // MARK: Title
    
    var title: String = "&lrm;"
    
    /// Title of the `index.html`, stored in the `<title>` tag
    public func title(_ value: String) -> Self {
        title = value
        return self
    }
    
    // MARK: Meta tags
    
    var metas: [[String: String]] = [
        ["charset": "utf-8"],
        ["viewport": "width=device-width, initial-scale=1.0, viewport-fit=cover, user-scalable=no"],
        ["description": ""]
    ]
    
    /// Meta of the `index.html`, stored in the `<meta name="" content="">` tag
    public func meta(name: String, _ content: String) -> Self {
        metas.append(["name": name, "content": content])
        return self
    }
    
    /// Meta of the `index.html`, stored in the `<meta property="" content="">` tag
    public func meta(property: String, _ content: String) -> Self {
        metas.append(["property": property, "content": content])
        return self
    }
    
    // MARK: Charset
    
    /// Charset of the `index.html`, stored in the `<meta charset>` tag
    public func charset(_ value: String) -> Self {
        metas.append(["charset": value])
        return self
    }
    
    // MARK: Viewport
    
    /// Viewport of the `index.html`, stored in the `<meta name="viewport">` tag
    public func viewport(_ value: String) -> Self {
        metas.append(["viewport": value])
        return self
    }
    
    // MARK: Description
    
    /// Description of the `index.html`, stored in the `<meta name="description">` tag
    public func description(_ value: String) -> Self {
        metas.append(["description": value])
        return self
    }
    
    // MARK: Link tags
    
    var links: [[String: String]] = []
    
    /// Link of the `index.html`, stored in the `<link rel="" href="">` tag
    public func link(rel: String, media: String? = nil, type: String? = nil, sizes: String? = nil, href: String) -> Self {
        var params: [String: String] = ["rel": rel, "href": href]
        if let media {
            params["media"] = media
        }
        if let type {
            params["type"] = type
        }
        if let sizes {
            params["sizes"] = sizes
        }
        links.append(params)
        return self
    }
    
    // MARK: Script tags
    
    var scripts: [[String: String]] = []
    
    /// Script of the `index.html`, stored in the `<script type="" name="" src="" async>` tag
    public func script(type: String? = nil, name: String, src: String, async: Bool = true, crossorigin: Bool = false) -> Self {
        var params: [String: String] = ["name": name, "src": src]
        if let type {
            params["type"] = type
        }
        if async {
            params["async"] = "yes"
        }
        if crossorigin {
            params["crossorigin"] = "yes"
        }
        scripts.append(params)
        return self
    }
}
