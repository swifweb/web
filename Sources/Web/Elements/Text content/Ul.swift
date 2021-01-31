//
//  Ul.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<ul>` element represents an unordered list of items,
/// typically rendered as a bulleted list.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ul)
open class Ul: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
