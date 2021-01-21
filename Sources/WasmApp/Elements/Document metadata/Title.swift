//
//  Title.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

/// The HTML Title element `<title>` defines the document's title
/// that is shown in a Browser's title bar or a page's tab.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title)
open class Title: BaseContentElement, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
    
    required public convenience init (_ title: String) {
        self.init()
        value = title
    }
}
