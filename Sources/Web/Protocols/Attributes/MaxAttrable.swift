//
//  MaxAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MaxAttrable {
    @discardableResult
    func max(_ value: Double) -> Self
    @discardableResult
    func max(_ value: State<Double>) -> Self
    @discardableResult
    func max<V>(_ expressable: ExpressableState<V, Double>) -> Self
}

protocol _MaxAttrable: _AnyElement, MaxAttrable {}

extension MaxAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: Double) -> Self {
        guard let s = self as? _MaxAttrable else { return self }
        s.domElement.max = value.jsValue()
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: State<Double>) -> Self {
        value.listen { self.max($0) }
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max<V>(_ expressable: ExpressableState<V, Double>) -> Self {
        max(expressable.unwrap())
    }
}
extension Meter: _MaxAttrable {}
extension Progress: _MaxAttrable {}
extension InputNumber: _MaxAttrable {}
extension InputRange: _MaxAttrable {}

public protocol MaxDateAttrable {
    @discardableResult
    func max(_ value: String) -> Self
    @discardableResult
    func max(_ value: State<String>) -> Self
    @discardableResult
    func max<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _MaxDateAttrable: _AnyElement, MaxDateAttrable {}

extension MaxDateAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: String) -> Self {
        guard let s = self as? _MaxDateAttrable else { return self }
        s.domElement.max = value.jsValue()
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: State<String>) -> Self {
        value.listen { self.max($0) }
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max<V>(_ expressable: ExpressableState<V, String>) -> Self {
        max(expressable.unwrap())
    }
}
extension InputDateTime: _MaxDateAttrable {}
extension InputDate: _MaxDateAttrable {}
extension InputTime: _MaxDateAttrable {}
extension InputWeek: _MaxDateAttrable {}
extension InputMonth: _MaxDateAttrable {}
