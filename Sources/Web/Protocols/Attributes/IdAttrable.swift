//
//  IdAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol IdAttrable {
    @discardableResult
    func id(_ value: String) -> Self
    @discardableResult
    func id<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _IdAttrable: _AnyElement, IdAttrable {}

extension IdAttrable {
    /// The id attribute specifies a unique id for an HTML element (the value must be unique within the HTML document).
    ///
    /// [More info →](https://www.w3schools.com/tags/att_id.asp)
    @discardableResult
    public func id(_ value: String) -> Self {
        guard let s = self as? _IdAttrable else { return self }
        s.domElement.id = value.jsValue()
        return self
    }
    
    /// The id attribute specifies a unique id for an HTML element (the value must be unique within the HTML document).
    ///
    /// [More info →](https://www.w3schools.com/tags/att_id.asp)
    @discardableResult
    public func id<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        id(value.stateValue.wrappedValue)
        value.stateValue.listen { self.id($0) }
        return self
    }
}

extension BaseElement: _IdAttrable {}
