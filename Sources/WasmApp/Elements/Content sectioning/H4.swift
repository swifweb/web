//
//  H4.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <h1>–<h6> elements represent six levels of section headings.
/// <h1> is the highest section level and <h6> is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h4)
open class H4: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
