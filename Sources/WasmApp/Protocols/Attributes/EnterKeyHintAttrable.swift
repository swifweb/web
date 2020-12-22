//
//  EnterKeyHintAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol EnterKeyHintAttrable {
    @discardableResult
    func enterKeyHint(_ value: EnterKeyHintType) -> Self
    @discardableResult
    func enterKeyHint(_ value: State<EnterKeyHintType>) -> Self
    @discardableResult
    func enterKeyHint<V>(_ expressable: ExpressableState<V, EnterKeyHintType>) -> Self
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
        s.domElement.enterkeyhint = value.value.jsValue()
        return self
    }
    
    /// The enterkeyhint specifies what action label (or icon)
    /// to present for the enter key on virtual keyboards.
    ///
    /// [More info →](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute)
    @discardableResult
    public func enterKeyHint(_ value: State<EnterKeyHintType>) -> Self {
        value.listen { self.enterKeyHint($0) }
        return self
    }
    
    /// The enterkeyhint specifies what action label (or icon)
    /// to present for the enter key on virtual keyboards.
    ///
    /// [More info →](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute)
    @discardableResult
    public func enterKeyHint<V>(_ expressable: ExpressableState<V, EnterKeyHintType>) -> Self {
        enterKeyHint(expressable.unwrap())
    }
}

extension BaseElement: _EnterKeyHintAttrable {} // should be on TextArea and `contenteditable`
