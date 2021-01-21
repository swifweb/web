//
//  P.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <p> element represents a paragraph.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/p)
open class P: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
