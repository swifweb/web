//
//  SrcDocAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SrcDocAttrable {
    @discardableResult
    func srcDoc(_ value: String) -> Self
    @discardableResult
    func srcDoc(_ value: State<String>) -> Self
    @discardableResult
    func srcDoc<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _SrcDocAttrable: _AnyElement, SrcDocAttrable {}

extension SrcDocAttrable {
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func srcDoc(_ value: String) -> Self {
        guard let s = self as? _SrcDocAttrable else { return self }
        s.domElement.srcdoc = value.jsValue()
        return self
    }
    
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func srcDoc(_ value: State<String>) -> Self {
        value.listen { self.srcDoc($0) }
        return self
    }
    
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Applicable to <iframe>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srcdoc.asp)
    @discardableResult
    public func srcDoc<V>(_ expressable: ExpressableState<V, String>) -> Self {
        srcDoc(expressable.unwrap())
    }
}

extension IFrame: _SrcDocAttrable {}
