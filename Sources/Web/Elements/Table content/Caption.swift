//
//  Caption.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <caption> element specifies the caption (or title) of a table.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/caption)
open class Caption: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
