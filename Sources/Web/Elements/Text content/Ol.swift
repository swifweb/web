//
//  Ol.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<ol>` element represents an ordered list of items — typically rendered as a numbered list.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ol)
open class Ol: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
