//
//  SlotAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SlotAttrable: DOMElement {
    @discardableResult
    func slot(_ value: String) -> Self
    @discardableResult
    func slot<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SlotAttrable {
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func slot(_ value: String) -> Self {
        setAttribute("slot", value)
        return self
    }
    
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func slot<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        slot(value.stateValue)
        value.stateValue.listen { self.slot($0) }
        return self
    }
}

extension BaseElement: SlotAttrable {}
