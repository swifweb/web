//
//  AltAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AltAttrable: DOMElement {
    @discardableResult
    func alt(_ value: String) -> Self
    @discardableResult
    func alt<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension AltAttrable {
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to `<area>`, `<img>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func alt(_ value: String) -> Self {
        setAttribute("alt", value)
        return self
    }
    
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to `<area>`, `<img>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func alt<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        alt(value.stateValue.wrappedValue)
        value.stateValue.listen { self.alt($0) }
        return self
    }
}

extension Area: AltAttrable {}
extension Img: AltAttrable {}
extension InputImage: AltAttrable {}
