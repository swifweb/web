//
//  ClassAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ClassAttrable: DOMElement {
    @discardableResult
    func `class`(_ value: [Class]) -> Self
    @discardableResult
    func `class`(_ value: Class...) -> Self
    @discardableResult
    func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Class
    @discardableResult
    func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Class]
}

extension ClassAttrable {
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    private func `class`(value: Class) -> Self {
        setAttribute("class", value.name)
        properties._classes.insert(value.name)
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: [Class]) -> Self {
        let value = value.map { $0.name }.joined(separator: ",")
        setAttribute("class", value)
        properties._classes.insert(value)
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: Class...) -> Self {
        `class`(value)
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Class {
        `class`(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.`class`(value: $0) }
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Class] {
        `class`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`class`($0) }
        return self
    }
}

extension BaseElement: ClassAttrable {}
