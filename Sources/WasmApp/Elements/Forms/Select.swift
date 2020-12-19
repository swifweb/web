//
//  Select.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <select> element represents a control that provides a menu of options
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select)
open class Select: BaseActiveElement, _ChangeHandleable, _ScrollHandleable {
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        scrollClosure?.release()
    }
}
