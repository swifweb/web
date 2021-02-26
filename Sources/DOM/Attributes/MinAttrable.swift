//
//  MinAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MinAttrable: DOMElement {
    @discardableResult
    func min(_ value: Double) -> Self
    @discardableResult
    func min<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension MinAttrable {
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min(_ value: Double) -> Self {
        setAttribute("min", value)
        return self
    }
    
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        min(value.stateValue.wrappedValue)
        value.stateValue.listen { self.min($0) }
        return self
    }
}
extension Meter: MinAttrable {}
extension InputNumber: MinAttrable {}
extension InputRange: MinAttrable {}

public protocol MinDateAttrable: DOMElement {
    @discardableResult
    func min(_ value: String) -> Self
    @discardableResult
    func min(_ value: State<String>) -> Self
    @discardableResult
    func min<V>(_ expressable: ExpressableState<V, String>) -> Self
}

extension MinDateAttrable {
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min(_ value: String) -> Self {
        setAttribute("min", value)
        return self
    }
    
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min(_ value: State<String>) -> Self {
        value.listen { self.min($0) }
        return self
    }
    
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min<V>(_ expressable: ExpressableState<V, String>) -> Self {
        min(expressable.unwrap())
    }
}
extension InputDateTime: MinDateAttrable {}
extension InputDate: MinDateAttrable {}
extension InputTime: MinDateAttrable {}
extension InputWeek: MinDateAttrable {}
extension InputMonth: MinDateAttrable {}
