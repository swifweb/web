//
//  RowSpanAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol RowSpanAttrable {
    @discardableResult
    func rowSpan(_ value: Int) -> Self
    @discardableResult
    func rowSpan(_ value: State<Int>) -> Self
    @discardableResult
    func rowSpan<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _RowSpanAttrable: _AnyElement, RowSpanAttrable {}

extension RowSpanAttrable {
    /// The rowspan attribute specifies the number of rows a cell should span.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_rowspan.asp)
    @discardableResult
    public func rowSpan(_ value: Int) -> Self {
        guard let s = self as? _RowSpanAttrable else { return self }
        s.domElement.rowSpan = value.jsValue()
        return self
    }
    
    /// The rowspan attribute specifies the number of rows a cell should span.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_rowspan.asp)
    @discardableResult
    public func rowSpan(_ value: State<Int>) -> Self {
        value.listen { self.rowSpan($0) }
        return self
    }
    
    /// The rowspan attribute specifies the number of rows a cell should span.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_rowspan.asp)
    @discardableResult
    public func rowSpan<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        rowSpan(expressable.unwrap())
    }
}

extension Td: _RowSpanAttrable {}
extension Th: _RowSpanAttrable {}
