//
//  AccessKeyAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AccessKeyAttrable {
    @discardableResult
    func accessKey(_ value: String) -> Self
    @discardableResult
    func accessKey<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _AccessKeyAttrable: _AnyElement, AccessKeyAttrable {}

extension AccessKeyAttrable {
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey(_ value: String) -> Self {
        guard let s = self as? _AccessKeyAttrable else { return self }
        s.setAttribute("accessKey", value)
        return self
    }
    
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        accessKey(value.stateValue.wrappedValue)
        value.stateValue.listen { self.accessKey($0) }
        return self
    }
}

extension BaseActiveElement: _AccessKeyAttrable {}
