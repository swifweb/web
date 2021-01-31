//
//  Dd.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<dd>` element provides the description, definition,
/// or value for the preceding term (dt) in a description list (dl).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dd)
open class Dd: BaseActiveElement, _ScrollHandleable, _StringInitializable {
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
