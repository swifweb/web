//
//  TargetAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol TargetAttrable {
    @discardableResult
    func target(_ value: TargetType) -> Self
    @discardableResult
    func target<S>(_ value: S) -> Self where S: StateConvertible, S.Value == TargetType
}

protocol _TargetAttrable: _AnyElement, TargetAttrable {}

extension TargetAttrable {
    /// Specifies where to open the linked document (in the case of an `<a>` element)
    /// or where to display the response recieved (in the case of a `<form>` element)
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/target)
    @discardableResult
    public func target(_ value: TargetType) -> Self {
        guard let s = self as? _TargetAttrable else { return self }
        s.domElement.target = value.rawValue.jsValue()
        return self
    }
    
    /// Specifies where to open the linked document (in the case of an `<a>` element)
    /// or where to display the response recieved (in the case of a `<form>` element)
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/target)
    @discardableResult
    public func target<S>(_ value: S) -> Self where S: StateConvertible, S.Value == TargetType {
        target(value.stateValue.wrappedValue)
        value.stateValue.listen { self.target($0) }
        return self
    }
}

extension A: _TargetAttrable {}
extension Area: _TargetAttrable {}
extension Base: _TargetAttrable {}
extension Form: _TargetAttrable {}
