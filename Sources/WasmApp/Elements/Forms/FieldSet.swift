//
//  FieldSet.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<fieldset>` element is used to group several controls as well as labels (label) within a web form.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset)
open class FieldSet: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
