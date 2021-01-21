//
//  MultipleAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MultipleAttrable {
    @discardableResult
    func multiple(_ value: Bool) -> Self
    @discardableResult
    func multiple(_ value: State<Bool>) -> Self
    @discardableResult
    func multiple<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _MultipleAttrable: _AnyElement, MultipleAttrable {}

extension MultipleAttrable {
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to <input>, <select>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple(_ value: Bool) -> Self {
        guard let s = self as? _MultipleAttrable else { return self }
        s.domElement.multiple = value.jsValue()
        return self
    }
    
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to <input>, <select>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple(_ value: State<Bool>) -> Self {
        value.listen { self.multiple($0) }
        return self
    }
    
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to <input>, <select>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        multiple(expressable.unwrap())
    }
}

extension InputEmail: _MultipleAttrable {}
extension InputFile: _MultipleAttrable {}
extension Select: _MultipleAttrable {}
