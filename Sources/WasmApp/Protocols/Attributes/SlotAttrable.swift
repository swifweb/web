//
//  SlotAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SlotAttrable {
    @discardableResult
    func slot(_ value: String) -> Self
    @discardableResult
    func slot(_ value: State<String>) -> Self
    @discardableResult
    func slot<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _SlotAttrable: _AnyElement, SlotAttrable {}

extension SlotAttrable {
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func slot(_ value: String) -> Self {
        guard let s = self as? _SlotAttrable else { return self }
        s.domElement.slot = value.jsValue()
        return self
    }
    
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func slot(_ value: State<String>) -> Self {
        value.listen { self.slot($0) }
        return self
    }
    
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func slot<V>(_ expressable: ExpressableState<V, String>) -> Self {
        slot(expressable.unwrap())
    }
}

extension BaseElement: _SlotAttrable {}
