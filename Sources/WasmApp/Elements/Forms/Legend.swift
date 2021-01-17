//
//  Legend.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

/// The HTML `<legend>` element represents a caption for the content of its parent fieldset.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/legend)
open class Legend: BaseActiveElement, _StringInitializable {
    @State public var text: String = ""
    
    public required convenience init(_ value: String) {
        self.init()
        self.value = value
    }
    
    public required convenience init(_ value: State<String>) {
        self.init()
        self.value = value.wrappedValue
        _text.wrappedValue = value.wrappedValue
        _text.merge(with: value, leftChanged: { new in
            self.value = new
        }, rightChanged: { new in
            self.value = new
        })
    }
}
