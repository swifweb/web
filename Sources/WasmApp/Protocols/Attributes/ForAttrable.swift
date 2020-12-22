//
//  ForAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ForAttrable {
    @discardableResult
    func `for`(_ value: String) -> Self
    @discardableResult
    func `for`(_ value: BaseElement) -> Self
    @discardableResult
    func `for`(_ value: State<String>) -> Self
    @discardableResult
    func `for`<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _ForAttrable: _AnyElement, ForAttrable {}

extension ForAttrable {
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to <label>, <output>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ value: String) -> Self {
        guard let s = self as? _ForAttrable else { return self }
        s.domElement.for = value.jsValue()
        return self
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to <label>, <output>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ value: BaseElement) -> Self {
        `for`(value.uid)
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to <label>, <output>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ value: State<String>) -> Self {
        value.listen { self.`for`($0) }
        return self
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to <label>, <output>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`<V>(_ expressable: ExpressableState<V, String>) -> Self {
        `for`(expressable.unwrap())
    }
}

extension Label: _ForAttrable {}
extension Output: _ForAttrable {}
