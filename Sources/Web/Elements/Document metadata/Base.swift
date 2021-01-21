//
//  Base.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

/// The HTML `<base>` element specifies the base URL to use for all relative URLs in a document.
/// There can be only one `<base>` element in a document.
///
/// A document's used base URL can be accessed by scripts with **document.baseURI**.
/// If the document has no `<base>` elements, then baseURI defaults to **location.href**.
///
/// ```swift
/// Base().href("https://www.example.com/")
/// Base().target("_blank")
/// Base().target("_top").href("https://example.com/")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base)
open class Base: BaseElement {}
