//
//  Button.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

/// The HTML <button> element represents a clickable button,
/// used to submit forms or anywhere in a document for accessible, standard button functionality.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button)
open class Button: BaseActiveElement, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
    
    required public convenience init (_ title: String) {
        self.init()
        value = title
    }
}
