//
//  ScopeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ScopeAttrable {
    @discardableResult
    func scope(_ value: ScopeType) -> Self
    @discardableResult
    func scope<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ScopeType
}

protocol _ScopeAttrable: _AnyElement, ScopeAttrable {}

extension ScopeAttrable {
    /// Defines the cells that the header test (defined in the th element) relates to.
    ///
    /// Applicable to `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_scope.asp)
    @discardableResult
    public func scope(_ value: ScopeType) -> Self {
        guard let s = self as? _ScopeAttrable else { return self }
        s.setAttribute("scope", value.value)
        return self
    }
    
    /// Defines the cells that the header test (defined in the th element) relates to.
    ///
    /// Applicable to `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_scope.asp)
    @discardableResult
    public func scope<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ScopeType {
        scope(value.stateValue.wrappedValue)
        value.stateValue.listen { self.scope($0) }
        return self
    }
}

extension Th: _ScopeAttrable {}
