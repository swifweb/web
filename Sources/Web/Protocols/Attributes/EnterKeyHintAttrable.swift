//
//  EnterKeyHintAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol EnterKeyHintAttrable {
    @discardableResult
    func enterKeyHint(_ value: EnterKeyHintType) -> Self
    @discardableResult
    func enterKeyHint<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EnterKeyHintType
}

protocol _EnterKeyHintAttrable: _AnyElement, EnterKeyHintAttrable {}

extension EnterKeyHintAttrable {
    /// The enterkeyhint specifies what action label (or icon)
    /// to present for the enter key on virtual keyboards.
    ///
    /// [More info →](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute)
    @discardableResult
    public func enterKeyHint(_ value: EnterKeyHintType) -> Self {
        guard let s = self as? _EnterKeyHintAttrable else { return self }
        s.setAttribute("enterkeyhint", value.value)
        return self
    }
    
    /// The enterkeyhint specifies what action label (or icon)
    /// to present for the enter key on virtual keyboards.
    ///
    /// [More info →](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute)
    @discardableResult
    public func enterKeyHint<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EnterKeyHintType {
        enterKeyHint(value.stateValue.wrappedValue)
        value.stateValue.listen { self.enterKeyHint($0) }
        return self
    }
}

extension BaseElement: _EnterKeyHintAttrable {} // should be on TextArea and `contenteditable`
