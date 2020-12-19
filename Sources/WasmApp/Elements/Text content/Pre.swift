//
//  Pre.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <pre> element represents preformatted text
/// which is to be presented exactly as written in the HTML file.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/pre)
open class Pre: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
