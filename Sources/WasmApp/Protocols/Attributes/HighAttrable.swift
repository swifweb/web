//
//  HighAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HighAttrable {
    @discardableResult
    func high(_ value: Double) -> Self
    @discardableResult
    func high(_ value: State<Double>) -> Self
    @discardableResult
    func high<V>(_ expressable: ExpressableState<V, Double>) -> Self
}

protocol _HighAttrable: _AnyElement, HighAttrable {}

extension HighAttrable {
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high(_ value: Double) -> Self {
        guard let s = self as? _HighAttrable else { return self }
        s.domElement.high = value.jsValue()
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high(_ value: State<Double>) -> Self {
        value.listen { self.high($0) }
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high<V>(_ expressable: ExpressableState<V, Double>) -> Self {
        high(expressable.unwrap())
    }
}

extension Meter: _HighAttrable {}
