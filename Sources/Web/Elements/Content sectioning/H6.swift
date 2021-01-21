//
//  H6.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <h1>–<h6> elements represent six levels of section headings.
/// <h1> is the highest section level and <h6> is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h6)
open class H6: BaseActiveElement, _ScrollHandleable, _StringInitializable {
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
