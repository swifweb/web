//
//  WrapAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol WrapAttrable {
    @discardableResult
    func wrap(_ value: AlignType) -> Self
    @discardableResult
    func wrap(_ value: State<AlignType>) -> Self
    @discardableResult
    func wrap<V>(_ expressable: ExpressableState<V, AlignType>) -> Self
}

protocol _WrapAttrable: _AnyElement, WrapAttrable {}

extension WrapAttrable {
    /// Indicates how the control wraps text.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
    @discardableResult
    public func wrap(_ value: AlignType) -> Self {
        guard let s = self as? _WrapAttrable else { return self }
        s.domElement.wrap = value.value.jsValue()
        return self
    }
    
    /// Indicates how the control wraps text.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
    @discardableResult
    public func wrap(_ value: State<AlignType>) -> Self {
        value.listen { self.wrap($0) }
        return self
    }
    
    /// Indicates how the control wraps text.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
    @discardableResult
    public func wrap<V>(_ expressable: ExpressableState<V, AlignType>) -> Self {
        wrap(expressable.unwrap())
    }
}

extension TextArea: _WrapAttrable {}
