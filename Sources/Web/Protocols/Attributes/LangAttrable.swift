//
//  LangAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LangAttrable {
    @discardableResult
    func lang(_ value: String) -> Self
    @discardableResult
    func lang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _LangAttrable: _AnyElement, LangAttrable {}

extension LangAttrable {
    /// The lang attribute specifies the language of the element's content.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_lang.asp)
    @discardableResult
    public func lang(_ value: String) -> Self {
        guard let s = self as? _LangAttrable else { return self }
        s.domElement.lang = value.jsValue()
        return self
    }
    
    /// The lang attribute specifies the language of the element's content.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_lang.asp)
    @discardableResult
    public func lang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        lang(value.stateValue.wrappedValue)
        value.stateValue.listen { self.lang($0) }
        return self
    }
}

extension BaseElement: _LangAttrable {}
