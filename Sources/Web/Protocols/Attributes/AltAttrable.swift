//
//  AltAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AltAttrable {
    @discardableResult
    func alt(_ value: String) -> Self
    @discardableResult
    func alt<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _AltAttrable: _AnyElement, AltAttrable {}

extension AltAttrable {
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to `<area>`, `<img>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func alt(_ value: String) -> Self {
        guard let s = self as? _AltAttrable else { return self }
        s.domElement.alt = value.jsValue()
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

extension Area: _AltAttrable {}
extension Img: _AltAttrable {}
extension InputImage: _AltAttrable {}
