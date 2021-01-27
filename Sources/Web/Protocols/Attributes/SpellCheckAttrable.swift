//
//  SpellCheckAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SpellCheckAttrable {
    @discardableResult
    func spellcheck(_ value: Bool) -> Self
    @discardableResult
    func spellcheck<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _SpellCheckAttrable: _AnyElement, SpellCheckAttrable {}

extension SpellCheckAttrable {
    /// Indicates whether spell checking is allowed for the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
    @discardableResult
    public func spellcheck(_ value: Bool) -> Self {
        guard let s = self as? _SpellCheckAttrable else { return self }
        s.setAttribute("spellcheck", value, .full)
        return self
    }
    
    /// Indicates whether spell checking is allowed for the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
    @discardableResult
    public func spellcheck<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        spellcheck(value.stateValue.wrappedValue)
        value.stateValue.listen { self.spellcheck($0) }
        return self
    }
}

extension BaseElement: _SpellCheckAttrable {}
