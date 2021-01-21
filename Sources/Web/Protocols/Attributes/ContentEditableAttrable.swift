//
//  ContentEditableAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ContentEditableAttrable {
    @discardableResult
    func contentEditable(_ value: Bool) -> Self
    @discardableResult
    func contentEditable(_ value: State<Bool>) -> Self
    @discardableResult
    func contentEditable<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _ContentEditableAttrable: _AnyElement, ContentEditableAttrable {}

extension ContentEditableAttrable {
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable(_ value: Bool) -> Self {
        guard let s = self as? _ContentEditableAttrable else { return self }
        s.domElement.contentEditable = value.jsValue()
        return self
    }
    
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable(_ value: State<Bool>) -> Self {
        value.listen { self.contentEditable($0) }
        return self
    }
    
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        contentEditable(expressable.unwrap())
    }
}

extension BaseElement: _ContentEditableAttrable {}
