//
//  LanguageAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LanguageAttrable {
    @discardableResult
    func language(_ value: String) -> Self
    @discardableResult
    func language(_ value: State<String>) -> Self
    @discardableResult
    func language<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _LanguageAttrable: _AnyElement, LanguageAttrable {}

extension LanguageAttrable {
    /// Defines the script language used in the element.
    ///
    /// Applicable to <script>
    @discardableResult
    public func language(_ value: String) -> Self {
        guard let s = self as? _LanguageAttrable else { return self }
        s.domElement.language = value.jsValue()
        return self
    }
    
    /// Defines the script language used in the element.
    ///
    /// Applicable to <script>
    @discardableResult
    public func language(_ value: State<String>) -> Self {
        value.listen { self.language($0) }
        return self
    }
    
    /// Defines the script language used in the element.
    ///
    /// Applicable to <script>
    @discardableResult
    public func language<V>(_ expressable: ExpressableState<V, String>) -> Self {
        language(expressable.unwrap())
    }
}

extension Script: _LanguageAttrable {}
