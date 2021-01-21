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
    func alt(_ value: State<String>) -> Self
    @discardableResult
    func alt<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _AltAttrable: _AnyElement, AltAttrable {}

extension AltAttrable {
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to <area>, <img>, <input>
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
    /// Applicable to <area>, <img>, <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func alt(_ value: State<String>) -> Self {
        value.listen { self.alt($0) }
        return self
    }
    
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to <area>, <img>, <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func alt<V>(_ expressable: ExpressableState<V, String>) -> Self {
        alt(expressable.unwrap())
    }
}

extension Area: _AltAttrable {}
extension Img: _AltAttrable {}
extension InputImage: _AltAttrable {}
