//
//  Div.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

/// The HTML Content Division element `<div>` is the generic container for flow content.
/// It has no effect on the content or layout until styled
/// in some way using CSS (e.g. styling is directly applied to it,
/// or some kind of layout model like Flexbox is applied to its parent element).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/div)
open class Div: BaseActiveElement, _ScrollHandleable, _StringInitializable {
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
