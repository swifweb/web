//
//  DirAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol DirAttrable {
    @discardableResult
    func dir(_ value: DirType) -> Self
    @discardableResult
    func dir<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DirType
}

protocol _DirAttrable: _AnyElement, DirAttrable {}

extension DirAttrable {
    /// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
    @discardableResult
    public func dir(_ value: DirType) -> Self {
        guard let s = self as? _DirAttrable else { return self }
        s.setAttribute("dir", value.value)
        return self
    }
    
    /// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
    @discardableResult
    public func dir<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DirType {
        dir(value.stateValue.wrappedValue)
        value.stateValue.listen { self.dir($0) }
        return self
    }
}

extension BaseElement: _DirAttrable {}
