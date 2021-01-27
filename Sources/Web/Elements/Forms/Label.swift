//
//  Label.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public typealias WLabel = Label

/// The HTML `<label>` element represents a caption for an item in a user interface.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label)
open class Label: BaseActiveElement, _StringInitializable {
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
