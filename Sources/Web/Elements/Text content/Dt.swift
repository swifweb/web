//
//  Dt.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<dt>` element specifies a term in a description or definition list,
/// and as such must be used inside a dl element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dt)
open class Dt: BaseActiveElement, _ScrollHandleable, _StringInitializable {
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
