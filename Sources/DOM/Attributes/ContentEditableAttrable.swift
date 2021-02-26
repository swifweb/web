//
//  ContentEditableAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ContentEditableAttrable: DOMElement {
    @discardableResult
    func contentEditable(_ value: Bool) -> Self
    @discardableResult
    func contentEditable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ContentEditableAttrable {
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable(_ value: Bool) -> Self {
        setAttribute("contentEditable", value, .full)
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

extension BaseElement: ContentEditableAttrable {}
