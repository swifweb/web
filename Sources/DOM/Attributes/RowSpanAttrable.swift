//
//  RowSpanAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol RowSpanAttrable: DOMElement {
    @discardableResult
    func rowSpan(_ value: Int) -> Self
    @discardableResult
    func rowSpan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension RowSpanAttrable {
    /// The rowspan attribute specifies the number of rows a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_rowspan.asp)
    @discardableResult
    public func rowSpan(_ value: Int) -> Self {
        setAttribute("rowSpan", value)
        return self
    }
    
    /// The rowspan attribute specifies the number of rows a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_rowspan.asp)
    @discardableResult
    public func rowSpan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        rowSpan(value.stateValue.wrappedValue)
        value.stateValue.listen { self.rowSpan($0) }
        return self
    }
}

extension Td: RowSpanAttrable {}
extension Th: RowSpanAttrable {}
