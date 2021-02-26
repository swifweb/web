//
//  AccessKeyAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AccessKeyAttrable: DOMElement {
    @discardableResult
    func accessKey(_ value: String) -> Self
    @discardableResult
    func accessKey<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension AccessKeyAttrable {
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey(_ value: String) -> Self {
        setAttribute("accessKey", value)
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

extension BaseActiveElement: AccessKeyAttrable {}
