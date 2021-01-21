//
//  ScopeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ScopeAttrable {
    @discardableResult
    func scope(_ value: ScopeType) -> Self
    @discardableResult
    func scope(_ value: State<ScopeType>) -> Self
    @discardableResult
    func scope<V>(_ expressable: ExpressableState<V, ScopeType>) -> Self
}

protocol _ScopeAttrable: _AnyElement, ScopeAttrable {}

extension ScopeAttrable {
    /// Defines the cells that the header test (defined in the th element) relates to.
    ///
    /// Applicable to <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_scope.asp)
    @discardableResult
    public func scope(_ value: ScopeType) -> Self {
        guard let s = self as? _ScopeAttrable else { return self }
        s.domElement.scope = value.value.jsValue()
        return self
    }
    
    /// Defines the cells that the header test (defined in the th element) relates to.
    ///
    /// Applicable to <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_scope.asp)
    @discardableResult
    public func scope(_ value: State<ScopeType>) -> Self {
        value.listen { self.scope($0) }
        return self
    }
    
    /// Defines the cells that the header test (defined in the th element) relates to.
    ///
    /// Applicable to <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_scope.asp)
    @discardableResult
    public func scope<V>(_ expressable: ExpressableState<V, ScopeType>) -> Self {
        scope(expressable.unwrap())
    }
}

extension Th: _ScopeAttrable {}
