//
//  TabIndexAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol TabIndexAttrable {
    @discardableResult
    func tabIndex(_ value: Int) -> Self
    @discardableResult
    func tabIndex<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

protocol _TabIndexAttrable: _AnyElement, TabIndexAttrable {}

extension TabIndexAttrable {
    /// Overrides the browser's default tab order and follows the one specified instead.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
    @discardableResult
    public func tabIndex(_ value: Int) -> Self {
        guard let s = self as? _TabIndexAttrable else { return self }
        s.setAttribute("tabindex", value)
        return self
    }
    
    /// Overrides the browser's default tab order and follows the one specified instead.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
    @discardableResult
    public func tabIndex<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        tabIndex(value.stateValue.wrappedValue)
        value.stateValue.listen { self.tabIndex($0) }
        return self
    }
}

extension BaseElement: _TabIndexAttrable {}
