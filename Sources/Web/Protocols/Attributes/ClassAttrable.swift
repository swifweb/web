//
//  ClassAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ClassAttrable {
    @discardableResult
    func `class`(_ value: [String]) -> Self
    @discardableResult
    func `class`(_ value: String...) -> Self
    @discardableResult
    func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String]
}

protocol _ClassAttrable: _AnyElement, ClassAttrable {}

extension ClassAttrable {
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    private func `class`(value: String) -> Self {
        guard let s = self as? _ClassAttrable else { return self }
        s.setAttribute("class", value)
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: [String]) -> Self {
        `class`(value: value.joined(separator: ","))
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: String...) -> Self {
        `class`(value)
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        `class`(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.`class`(value: $0) }
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String] {
        `class`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`class`($0) }
        return self
    }
}

extension BaseElement: _ClassAttrable {}
