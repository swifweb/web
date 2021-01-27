//
//  Option.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

/// The HTML `<option>` element is used to define an item contained in a select,
/// an optgroup, or a datalist element. As such, `<option>` can represent menu items
/// in popups and other lists of items in an HTML document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option)
open class Option: BaseActiveElement, _StringInitializable {
    @State public var text: String = ""
    
    public required convenience init(_ value: String) {
        self.init()
        self.value = value
    }
    
    public required convenience init(_ value: State<String>) {
        self.init()
        self.value = value.wrappedValue
        _text.wrappedValue = value.wrappedValue
        _text.merge(with: value, leftChanged: { [weak self] in
            self?.value = $0
        }, rightChanged: { [weak self] in
            self?.value = $0
        })
    }
    
    public required convenience init <V>(_ value: ExpressableState<V, String>) {
        self.init(value.unwrap())
    }
}
