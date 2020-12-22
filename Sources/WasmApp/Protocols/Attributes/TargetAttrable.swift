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
    func target(_ value: TargetType) -> Self
    @discardableResult
    func target(_ value: State<TargetType>) -> Self
    @discardableResult
    func target<V>(_ expressable: ExpressableState<V, TargetType>) -> Self
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
    public func target(_ value: TargetType) -> Self {
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
    public func target(_ value: State<TargetType>) -> Self {
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
    public func target<V>(_ expressable: ExpressableState<V, TargetType>) -> Self {
        target(expressable.unwrap())
    }
}

extension A: _TargetAttrable {}
extension Area: _TargetAttrable {}
extension Base: _TargetAttrable {}
extension Form: _TargetAttrable {}
