//
//  StartAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol StartAttrable: DOMElement {
    @discardableResult
    func start(_ value: Int) -> Self
    @discardableResult
    func start<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension StartAttrable {
    /// Defines the first number if other than 1.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_start.asp)
    @discardableResult
    public func start(_ value: Int) -> Self {
        setAttribute("start", value)
        return self
    }
    
    /// Defines the first number if other than 1.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_start.asp)
    @discardableResult
    public func start<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        start(value.stateValue.wrappedValue)
        value.stateValue.listen { self.start($0) }
        return self
    }
}

extension Ol: StartAttrable {}
