//
//  ItemPropAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ItemPropAttrable {
    @discardableResult
    func itemprop(_ value: String) -> Self
    @discardableResult
    func itemprop(_ value: State<String>) -> Self
    @discardableResult
    func itemprop<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _ItemPropAttrable: _AnyElement, ItemPropAttrable {}

extension ItemPropAttrable {
    /// Used  as key for key-value representation
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
    @discardableResult
    public func itemprop(_ value: String) -> Self {
        guard let s = self as? _ItemPropAttrable else { return self }
        s.domElement.itemprop = value.jsValue()
        return self
    }
    
    /// Used  as key for key-value representation
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
    @discardableResult
    public func itemprop(_ value: State<String>) -> Self {
        value.listen { self.itemprop($0) }
        return self
    }
    
    /// Used  as key for key-value representation
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
    @discardableResult
    public func itemprop<V>(_ expressable: ExpressableState<V, String>) -> Self {
        itemprop(expressable.unwrap())
    }
}

extension BaseElement: _ItemPropAttrable {}
