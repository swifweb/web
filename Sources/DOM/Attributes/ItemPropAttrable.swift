//
//  ItemPropAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ItemPropAttrable: DOMElement {
    @discardableResult
    func itemprop(_ value: String) -> Self
    @discardableResult
    func itemprop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension ItemPropAttrable {
    /// Used  as key for key-value representation
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
    @discardableResult
    public func itemprop(_ value: String) -> Self {
        setAttribute("itemprop", value)
        return self
    }
    
    /// Used  as key for key-value representation
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
    @discardableResult
    public func itemprop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        itemprop(value.stateValue.wrappedValue)
        value.stateValue.listen { self.itemprop($0) }
        return self
    }
}

extension BaseElement: ItemPropAttrable {}
