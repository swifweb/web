//
//  MethodAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MethodAttrable {
    @discardableResult
    func method(_ value: MethodType) -> Self
    @discardableResult
    func method(_ value: State<MethodType>) -> Self
    @discardableResult
    func method<V>(_ expressable: ExpressableState<V, MethodType>) -> Self
}

protocol _MethodAttrable: _AnyElement, MethodAttrable {}

extension MethodAttrable {
    /// Defines which HTTP method to use when submitting the form.
    /// Can be GET (default) or POST.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_method.asp)
    @discardableResult
    public func method(_ value: MethodType) -> Self {
        guard let s = self as? _MethodAttrable else { return self }
        s.domElement.method = value.value.jsValue()
        return self
    }
    
    /// Defines which HTTP method to use when submitting the form.
    /// Can be GET (default) or POST.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_method.asp)
    @discardableResult
    public func method(_ value: State<MethodType>) -> Self {
        value.listen { self.method($0) }
        return self
    }
    
    /// Defines which HTTP method to use when submitting the form.
    /// Can be GET (default) or POST.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_method.asp)
    @discardableResult
    public func method<V>(_ expressable: ExpressableState<V, MethodType>) -> Self {
        method(expressable.unwrap())
    }
}

extension Form: _MethodAttrable {}
