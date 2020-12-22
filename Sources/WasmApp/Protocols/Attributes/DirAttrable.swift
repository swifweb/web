//
//  DirAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DirAttrable {
    @discardableResult
    func dir(_ value: DirType) -> Self
    @discardableResult
    func dir(_ value: State<DirType>) -> Self
    @discardableResult
    func dir<V>(_ expressable: ExpressableState<V, DirType>) -> Self
}

protocol _DirAttrable: _AnyElement, DirAttrable {}

extension DirAttrable {
    /// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
    @discardableResult
    public func dir(_ value: DirType) -> Self {
        guard let s = self as? _DirAttrable else { return self }
        s.domElement.dir = value.value.jsValue()
        return self
    }
    
    /// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
    @discardableResult
    public func dir(_ value: State<DirType>) -> Self {
        value.listen { self.dir($0) }
        return self
    }
    
    /// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
    @discardableResult
    public func dir<V>(_ expressable: ExpressableState<V, DirType>) -> Self {
        dir(expressable.unwrap())
    }
}

extension BaseElement: _DirAttrable {}
