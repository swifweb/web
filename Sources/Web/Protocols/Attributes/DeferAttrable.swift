//
//  DeferAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DeferAttrable {
    @discardableResult
    func `defer`(_ value: Bool) -> Self
    @discardableResult
    func `defer`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _DeferAttrable: _AnyElement, DeferAttrable {}

extension DeferAttrable {
    /// Indicates that the script should be executed after the page has been parsed.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_defer.asp)
    @discardableResult
    public func `defer`(_ value: Bool) -> Self {
        guard let s = self as? _DeferAttrable else { return self }
        s.domElement.defer = value.jsValue()
        return self
    }
    
    /// Indicates that the script should be executed after the page has been parsed.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_defer.asp)
    @discardableResult
    public func `defer`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        `defer`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`defer`($0) }
        return self
    }
}

extension Script: _DeferAttrable {}
