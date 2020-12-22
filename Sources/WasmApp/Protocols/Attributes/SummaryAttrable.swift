//
//  SummaryAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SummaryAttrable {
    @discardableResult
    func summary(_ value: String) -> Self
    @discardableResult
    func summary(_ value: State<String>) -> Self
    @discardableResult
    func summary<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _SummaryAttrable: _AnyElement, SummaryAttrable {}

extension SummaryAttrable {
    /// The summary attribute specifies a summary of the content of a table.
    ///
    /// The summary attribute makes no visual difference in ordinary web browsers.
    ///
    /// This attribute can be used by screen readers
    ///
    /// Applicable to <table>
    ///
    /// [More info →](http://w3schools.sinsixx.com/tags/att_table_summary.asp.htm)
    @discardableResult
    public func summary(_ value: String) -> Self {
        guard let s = self as? _SummaryAttrable else { return self }
        s.domElement.summary = value.jsValue()
        return self
    }
    
    /// The summary attribute specifies a summary of the content of a table.
    ///
    /// The summary attribute makes no visual difference in ordinary web browsers.
    ///
    /// This attribute can be used by screen readers
    ///
    /// Applicable to <table>
    ///
    /// [More info →](http://w3schools.sinsixx.com/tags/att_table_summary.asp.htm)
    @discardableResult
    public func summary(_ value: State<String>) -> Self {
        value.listen { self.summary($0) }
        return self
    }
    
    /// The summary attribute specifies a summary of the content of a table.
    ///
    /// The summary attribute makes no visual difference in ordinary web browsers.
    ///
    /// This attribute can be used by screen readers
    ///
    /// Applicable to <table>
    ///
    /// [More info →](http://w3schools.sinsixx.com/tags/att_table_summary.asp.htm)
    @discardableResult
    public func summary<V>(_ expressable: ExpressableState<V, String>) -> Self {
        summary(expressable.unwrap())
    }
}

extension Table: _SummaryAttrable {}
