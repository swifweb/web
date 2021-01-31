//
//  BlockQuote.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<blockquote>` Element (or HTML Block Quotation Element) indicates
/// that the enclosed text is an extended quotation.
/// Usually, this is rendered visually by indentation (see Notes for how to change it).
/// A URL for the source of the quotation may be given using the cite attribute,
/// while a text representation of the source can be given using the cite element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote)
open class BlockQuote: BaseActiveElement, _ScrollHandleable, _StringInitializable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
    
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
    
    required public convenience init (_ title: String) {
        self.init()
        value = title
    }
}
