//
//  ForAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ForAttrable: DOMElement {
    @discardableResult
    func `for`(_ values: [String]) -> Self
    @discardableResult
    func `for`(_ values: String...) -> Self
    @discardableResult
    func `for`(_ values: [BaseElement]) -> Self
    @discardableResult
    func `for`(_ values: BaseElement...) -> Self
    @discardableResult
    func `for`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func `for`<S>(_ values: S) -> Self where S: StateConvertible, S.Value == [String]
}

extension ForAttrable {
    /// Defines the IDs of an elements which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: [String]) -> Self {
        setAttribute("for", values.joined(separator: " "))
        return self
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: String...) -> Self {
        `for`(values)
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: [BaseElement]) -> Self {
        `for`(values.map { $0.properties._id })
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: BaseElement...) -> Self {
        `for`(values)
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        `for`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`for`($0) }
        return self
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`<S>(_ values: S) -> Self where S: StateConvertible, S.Value == [String] {
        `for`(values.stateValue.wrappedValue)
        values.stateValue.listen { self.`for`($0) }
        return self
    }
}

extension Label: ForAttrable {}
extension Output: ForAttrable {}
