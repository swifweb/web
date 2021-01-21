//
//  THead.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <thead> element defines a set of rows defining the head of the columns of the table.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/thead)
open class THead: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
