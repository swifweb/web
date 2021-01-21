//
//  SpellCheckAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SpellCheckAttrable {
    @discardableResult
    func spellcheck(_ value: Bool) -> Self
    @discardableResult
    func spellcheck(_ value: State<Bool>) -> Self
    @discardableResult
    func spellcheck<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _SpellCheckAttrable: _AnyElement, SpellCheckAttrable {}

extension SpellCheckAttrable {
    /// Indicates whether spell checking is allowed for the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
    @discardableResult
    public func spellcheck(_ value: Bool) -> Self {
        guard let s = self as? _SpellCheckAttrable else { return self }
        s.domElement.spellcheck = value.jsValue()
        return self
    }
    
    /// Indicates whether spell checking is allowed for the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
    @discardableResult
    public func spellcheck(_ value: State<Bool>) -> Self {
        value.listen { self.spellcheck($0) }
        return self
    }
    
    /// Indicates whether spell checking is allowed for the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
    @discardableResult
    public func spellcheck<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        spellcheck(expressable.unwrap())
    }
}

extension BaseElement: _SpellCheckAttrable {}
