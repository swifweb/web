//
//  Dd.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <dd> element provides the description, definition,
/// or value for the preceding term (dt) in a description list (dl).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dd)
open class Dd: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
