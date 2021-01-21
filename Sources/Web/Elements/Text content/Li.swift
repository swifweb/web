//
//  Li.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <li> element is used to represent an item in a list.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li)
open class Li: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
