//
//  TBody.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML Table Body element (<tbody>) encapsulates a set
/// of table rows (tr elements), indicating that they comprise the body of the table (table).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tbody)
open class TBody: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
