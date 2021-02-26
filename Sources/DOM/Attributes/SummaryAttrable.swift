//
//  SummaryAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SummaryAttrable: DOMElement {
    @discardableResult
    func summary(_ value: String) -> Self
    @discardableResult
    func summary<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SummaryAttrable {
    /// The summary attribute specifies a summary of the content of a table.
    ///
    /// The summary attribute makes no visual difference in ordinary web browsers.
    ///
    /// This attribute can be used by screen readers
    ///
    /// Applicable to `<table>`
    ///
    /// [More info →](http://w3schools.sinsixx.com/tags/att_table_summary.asp.htm)
    @discardableResult
    public func summary(_ value: String) -> Self {
        setAttribute("summary", value)
        return self
    }
    
    /// The summary attribute specifies a summary of the content of a table.
    ///
    /// The summary attribute makes no visual difference in ordinary web browsers.
    ///
    /// This attribute can be used by screen readers
    ///
    /// Applicable to `<table>`
    ///
    /// [More info →](http://w3schools.sinsixx.com/tags/att_table_summary.asp.htm)
    @discardableResult
    public func summary<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        summary(value.stateValue.wrappedValue)
        value.stateValue.listen { self.summary($0) }
        return self
    }
}

extension Table: SummaryAttrable {}
