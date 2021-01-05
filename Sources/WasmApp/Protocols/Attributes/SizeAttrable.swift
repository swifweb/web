//
//  SizeAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SizeAttrable {
    @discardableResult
    func size(_ value: Int) -> Self
    @discardableResult
    func size(_ value: State<Int>) -> Self
    @discardableResult
    func size<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _SizeAttrable: _AnyElement, SizeAttrable {}

extension SizeAttrable {
    /// The size attribute defines the width of the <input> and the height of the <select> element.
    ///
    /// For the input, if the type attribute is text or password then it's the number of characters.
    /// This must be an integer value 0 or higher.
    /// If no size is specified, or an invalid value is specified, the input has no size declared,
    /// and the form control will be the default width based on the user agent.
    /// If CSS targets the element with properties impacting the width, CSS takes precedence.
    ///
    /// The size attribute has no impact on constraint validation.
    ///
    /// Applicable to <input>, <select>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/size)
    @discardableResult
    public func size(_ value: Int) -> Self {
        guard let s = self as? _SizeAttrable else { return self }
        s.domElement.size = value.jsValue()
        return self
    }
    
    /// The size attribute defines the width of the <input> and the height of the <select> element.
    ///
    /// For the input, if the type attribute is text or password then it's the number of characters.
    /// This must be an integer value 0 or higher.
    /// If no size is specified, or an invalid value is specified, the input has no size declared,
    /// and the form control will be the default width based on the user agent.
    /// If CSS targets the element with properties impacting the width, CSS takes precedence.
    ///
    /// The size attribute has no impact on constraint validation.
    ///
    /// Applicable to <input>, <select>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/size)
    @discardableResult
    public func size(_ value: State<Int>) -> Self {
        value.listen { self.size($0) }
        return self
    }
    
    /// The size attribute defines the width of the <input> and the height of the <select> element.
    ///
    /// For the input, if the type attribute is text or password then it's the number of characters.
    /// This must be an integer value 0 or higher.
    /// If no size is specified, or an invalid value is specified, the input has no size declared,
    /// and the form control will be the default width based on the user agent.
    /// If CSS targets the element with properties impacting the width, CSS takes precedence.
    ///
    /// The size attribute has no impact on constraint validation.
    ///
    /// Applicable to <input>, <select>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/size)
    @discardableResult
    public func size<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        size(expressable.unwrap())
    }
}

extension InputText: _SizeAttrable {}
extension InputTel: _SizeAttrable {}
extension InputEmail: _SizeAttrable {}
extension InputPassword: _SizeAttrable {}
extension Select: _SizeAttrable {}
