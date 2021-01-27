//
//  ContentEditableAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ContentEditableAttrable {
    @discardableResult
    func contentEditable(_ value: Bool) -> Self
    @discardableResult
    func contentEditable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _ContentEditableAttrable: _AnyElement, ContentEditableAttrable {}

extension ContentEditableAttrable {
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable(_ value: Bool) -> Self {
        guard let s = self as? _ContentEditableAttrable else { return self }
        s.setAttribute("contentEditable", value, .full)
        return self
    }
    
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        contentEditable(value.stateValue.wrappedValue)
        value.stateValue.listen { self.contentEditable($0) }
        return self
    }
}

extension BaseElement: _ContentEditableAttrable {}
