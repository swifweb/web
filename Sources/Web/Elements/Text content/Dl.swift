//
//  Dl.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<dl>` element represents a description list.
/// The element encloses a list of groups of terms (specified using the dt element)
/// and descriptions (provided by dd elements). Common uses for this element
/// are to implement a glossary or to display metadata (a list of key-value pairs).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dl)
open class Dl: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
