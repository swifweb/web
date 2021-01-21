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
    func `defer`(_ value: State<Bool>) -> Self
    @discardableResult
    func `defer`<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _DeferAttrable: _AnyElement, DeferAttrable {}

extension DeferAttrable {
    /// Indicates that the script should be executed after the page has been parsed.
    ///
    /// Applicable to <script>
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
    /// Applicable to <script>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_defer.asp)
    @discardableResult
    public func `defer`(_ value: State<Bool>) -> Self {
        value.listen { self.`defer`($0) }
        return self
    }
    
    /// Indicates that the script should be executed after the page has been parsed.
    ///
    /// Applicable to <script>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_defer.asp)
    @discardableResult
    public func `defer`<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        `defer`(expressable.unwrap())
    }
}

extension Script: _DeferAttrable {}
