//
//  LangAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol LangAttrable: DOMElement {
    @discardableResult
    func lang(_ value: String) -> Self
    @discardableResult
    func lang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension LangAttrable {
    /// The lang attribute specifies the language of the element's content.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_lang.asp)
    @discardableResult
    public func lang(_ value: String) -> Self {
        setAttribute("lang", value)
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

extension BaseElement: LangAttrable {}
