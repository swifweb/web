//
//  HiddenAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HiddenAttrable {
    @discardableResult
    func hidden(_ value: Bool) -> Self
    @discardableResult
    func hidden(_ value: State<Bool>) -> Self
    @discardableResult
    func hidden<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _HiddenAttrable: _AnyElement, HiddenAttrable {}

extension HiddenAttrable {
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden(_ value: Bool) -> Self {
        guard let s = self as? _HiddenAttrable else { return self }
        s.domElement.hidden = value.jsValue()
        return self
    }
    
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden(_ value: State<Bool>) -> Self {
        value.listen { self.hidden($0) }
        return self
    }
    
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        hidden(expressable.unwrap())
    }
}

extension BaseElement: _HiddenAttrable {}
