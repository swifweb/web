//
//  HttpEquivAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HttpEquivAttrable {
    @discardableResult
    func httpEquiv(_ value: String) -> Self
    @discardableResult
    func httpEquiv(_ value: State<String>) -> Self
    @discardableResult
    func httpEquiv<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _HttpEquivAttrable: _AnyElement, HttpEquivAttrable {}

extension HttpEquivAttrable {
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to <area>, <img>, <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func httpEquiv(_ value: String) -> Self {
        guard let s = self as? _HttpEquivAttrable else { return self }
        s.domElement.httpequiv = value.jsValue()
        return self
    }
    
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to <area>, <img>, <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func httpEquiv(_ value: State<String>) -> Self {
        value.listen { self.httpEquiv($0) }
        return self
    }
    
    /// Defines a pragma directive.
    ///
    /// Applicable to <meta>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_http-equiv.asp)
    @discardableResult
    public func httpEquiv<V>(_ expressable: ExpressableState<V, String>) -> Self {
        httpEquiv(expressable.unwrap())
    }
}

extension Meta: _HttpEquivAttrable {}
