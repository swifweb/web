//
//  ContentAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ContentAttrable: DOMElement {
    @discardableResult
    func content(_ value: String) -> Self
    @discardableResult
    func content<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension ContentAttrable {
    /// A value associated with http-equiv or name depending on the context.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/content)
    @discardableResult
    public func content(_ value: String) -> Self {
        setAttribute("content", value)
        return self
    }
    
    /// A value associated with http-equiv or name depending on the context.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/content)
    @discardableResult
    public func content<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        content(value.stateValue.wrappedValue)
        value.stateValue.listen { self.content($0) }
        return self
    }
}

extension Meta: ContentAttrable {}
