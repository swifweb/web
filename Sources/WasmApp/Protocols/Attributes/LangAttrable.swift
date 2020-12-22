//
//  LangAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LangAttrable {
    @discardableResult
    func lang(_ value: String) -> Self
    @discardableResult
    func lang(_ value: State<String>) -> Self
    @discardableResult
    func lang<V>(_ expressable: ExpressableState<V, String>) -> Self
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
    public func lang(_ value: State<String>) -> Self {
        value.listen { self.lang($0) }
        return self
    }
    
    /// The lang attribute specifies the language of the element's content.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_lang.asp)
    @discardableResult
    public func lang<V>(_ expressable: ExpressableState<V, String>) -> Self {
        lang(expressable.unwrap())
    }
}

extension BaseElement: _LangAttrable {}
