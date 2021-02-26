//
//  IdAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol IdAttrable: DOMElement {
    @discardableResult
    func id(_ value: Id) -> Self
    @discardableResult
    func id<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Id
}

extension IdAttrable {
    /// The id attribute specifies a unique id for an HTML element (the value must be unique within the HTML document).
    ///
    /// [More info →](https://www.w3schools.com/tags/att_id.asp)
    @discardableResult
    public func id(_ value: Id) -> Self {
        properties._id = value.name
        setAttribute("id", value.name)
        return self
    }
    
    /// The id attribute specifies a unique id for an HTML element (the value must be unique within the HTML document).
    ///
    /// [More info →](https://www.w3schools.com/tags/att_id.asp)
    @discardableResult
    public func id<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Id {
        id(value.stateValue.wrappedValue)
        value.stateValue.listen { self.id($0) }
        return self
    }
}

extension BaseElement: IdAttrable {}
