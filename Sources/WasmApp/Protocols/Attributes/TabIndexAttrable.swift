//
//  TabIndexAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol TabIndexAttrable {
    @discardableResult
    func tabIndex(_ value: Int) -> Self
    @discardableResult
    func tabIndex(_ value: State<Int>) -> Self
    @discardableResult
    func tabIndex<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _TabIndexAttrable: _AnyElement, TabIndexAttrable {}

extension TabIndexAttrable {
    /// Overrides the browser's default tab order and follows the one specified instead.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
    @discardableResult
    public func tabIndex(_ value: Int) -> Self {
        guard let s = self as? _TabIndexAttrable else { return self }
        s.domElement.tabindex = value.jsValue()
        return self
    }
    
    /// Overrides the browser's default tab order and follows the one specified instead.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
    @discardableResult
    public func tabIndex(_ value: State<Int>) -> Self {
        value.listen { self.tabIndex($0) }
        return self
    }
    
    /// Overrides the browser's default tab order and follows the one specified instead.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
    @discardableResult
    public func tabIndex<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        tabIndex(expressable.unwrap())
    }
}

extension BaseElement: _TabIndexAttrable {}
