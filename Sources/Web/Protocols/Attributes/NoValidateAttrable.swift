//
//  NoValidateAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol NoValidateAttrable {
    @discardableResult
    func noValidate(_ value: Bool) -> Self
    @discardableResult
    func noValidate(_ value: State<Bool>) -> Self
    @discardableResult
    func noValidate<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _NoValidateAttrable: _AnyElement, NoValidateAttrable {}

extension NoValidateAttrable {
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to <button>, <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func noValidate(_ value: Bool) -> Self {
        guard let s = self as? _NoValidateAttrable else { return self }
        s.domElement.novalidate = value.jsValue()
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to <button>, <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func noValidate(_ value: State<Bool>) -> Self {
        value.listen { self.noValidate($0) }
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_novalidate.asp)
    @discardableResult
    public func noValidate<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        noValidate(expressable.unwrap())
    }
}

extension Form: _NoValidateAttrable {}
