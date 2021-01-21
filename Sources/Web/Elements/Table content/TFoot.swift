//
//  TFoot.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <tfoot> element defines a set of rows summarizing the columns of the table.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tfoot)
open class TFoot: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
