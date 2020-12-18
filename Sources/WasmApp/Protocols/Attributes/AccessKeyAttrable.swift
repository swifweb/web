//
//  AccessKeyAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AccessKeyAttrable {
    @discardableResult
    func accessKey(_ value: String) -> Self
    @discardableResult
    func accessKey(_ value: State<String>) -> Self
    @discardableResult
    func accessKey<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _AccessKeyAttrable: _AnyElement, AccessKeyAttrable {}

extension AccessKeyAttrable {
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey(_ value: String) -> Self {
        guard let s = self as? _AccessKeyAttrable else { return self }
        s.domElement.accessKey = value.jsValue()
        return self
    }
    
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey(_ value: State<String>) -> Self {
        value.listen { self.accessKey($0) }
        return self
    }
    
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey<V>(_ expressable: ExpressableState<V, String>) -> Self {
        accessKey(expressable.unwrap())
    }
}

extension BaseActiveElement: _AccessKeyAttrable {}
