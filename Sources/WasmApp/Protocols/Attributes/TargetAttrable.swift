//
//  TargetAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol TargetAttrable {
    @discardableResult
    func target(_ value: Target) -> Self
    @discardableResult
    func target(_ value: State<Target>) -> Self
    @discardableResult
    func target<V>(_ expressable: ExpressableState<V, Target>) -> Self
}

protocol _TargetAttrable: _AnyElement, TargetAttrable {}

extension TargetAttrable {
    /// Specifies where to open the linked document (in the case of an <a> element)
    /// or where to display the response recieved (in the case of a <form> element)
    ///
    /// Applicable to <a>, <area>, <base>, and <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/target)
    @discardableResult
    public func target(_ value: Target) -> Self {
        guard let s = self as? _TargetAttrable else { return self }
        s.domElement.target = value.rawValue.jsValue()
        return self
    }
    
    /// Specifies where to open the linked document (in the case of an <a> element)
    /// or where to display the response recieved (in the case of a <form> element)
    ///
    /// Applicable to <a>, <area>, <base>, and <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/target)
    @discardableResult
    public func target(_ value: State<Target>) -> Self {
        value.listen { self.target($0) }
        return self
    }
    
    /// Specifies where to open the linked document (in the case of an <a> element)
    /// or where to display the response recieved (in the case of a <form> element)
    ///
    /// Applicable to <a>, <area>, <base>, and <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/target)
    @discardableResult
    public func target<V>(_ expressable: ExpressableState<V, Target>) -> Self {
        target(expressable.unwrap())
    }
}

extension A: _TargetAttrable {}
extension Area: _TargetAttrable {}
extension Base: _TargetAttrable {}
extension Form: _TargetAttrable {}
