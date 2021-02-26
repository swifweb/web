//
//  SrcLangAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SrcLangAttrable: DOMElement {
    @discardableResult
    func srcLang(_ value: String) -> Self
    @discardableResult
    func srcLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SrcLangAttrable {
    /// The srclang attribute specifies the language of the track text data.
    ///
    /// This attribute is required if kind="subtitles".
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srclang.asp)
    @discardableResult
    public func srcLang(_ value: String) -> Self {
        setAttribute("srclang", value)
        return self
    }
    
    /// The srclang attribute specifies the language of the track text data.
    ///
    /// This attribute is required if kind="subtitles".
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srclang.asp)
    @discardableResult
    public func srcLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        srcLang(value.stateValue.wrappedValue)
        value.stateValue.listen { self.srcLang($0) }
        return self
    }
}

extension Track: SrcLangAttrable {}
