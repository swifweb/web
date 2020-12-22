//
//  SrcLangAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SrcLangAttrable {
    @discardableResult
    func srcLang(_ value: String) -> Self
    @discardableResult
    func srcLang(_ value: State<String>) -> Self
    @discardableResult
    func srcLang<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _SrcLangAttrable: _AnyElement, SrcLangAttrable {}

extension SrcLangAttrable {
    /// The srclang attribute specifies the language of the track text data.
    ///
    /// This attribute is required if kind="subtitles".
    ///
    /// Applicable to <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srclang.asp)
    @discardableResult
    public func srcLang(_ value: String) -> Self {
        guard let s = self as? _SrcLangAttrable else { return self }
        s.domElement.srclang = value.jsValue()
        return self
    }
    
    /// The srclang attribute specifies the language of the track text data.
    ///
    /// This attribute is required if kind="subtitles".
    ///
    /// Applicable to <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srclang.asp)
    @discardableResult
    public func srcLang(_ value: State<String>) -> Self {
        value.listen { self.srcLang($0) }
        return self
    }
    
    /// The srclang attribute specifies the language of the track text data.
    ///
    /// This attribute is required if kind="subtitles".
    ///
    /// Applicable to <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srclang.asp)
    @discardableResult
    public func srcLang<V>(_ expressable: ExpressableState<V, String>) -> Self {
        srcLang(expressable.unwrap())
    }
}

extension Track: _SrcLangAttrable {}
