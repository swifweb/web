//
//  LabelAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LabelAttrable {
    @discardableResult
    func label(_ value: String) -> Self
    @discardableResult
    func label(_ value: State<String>) -> Self
    @discardableResult
    func label<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _LabelAttrable: _AnyElement, LabelAttrable {}

extension LabelAttrable {
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to <optgroup>, <option>, <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label(_ value: String) -> Self {
        guard let s = self as? _LabelAttrable else { return self }
        s.domElement.label = value.jsValue()
        return self
    }
    
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to <optgroup>, <option>, <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label(_ value: State<String>) -> Self {
        value.listen { self.label($0) }
        return self
    }
    
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to <optgroup>, <option>, <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label<V>(_ expressable: ExpressableState<V, String>) -> Self {
        label(expressable.unwrap())
    }
}

extension OptGroup: _LabelAttrable {}
extension Option: _LabelAttrable {}
extension Track: _LabelAttrable {}
