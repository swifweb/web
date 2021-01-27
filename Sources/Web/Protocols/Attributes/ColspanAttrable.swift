//
//  ColspanAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ColspanAttrable {
    @discardableResult
    func colspan(_ value: Int) -> Self
    @discardableResult
    func colspan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

protocol _ColspanAttrable: _AnyElement, ColspanAttrable {}

extension ColspanAttrable {
    /// The colspan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/colspan)
    @discardableResult
    public func colspan(_ value: Int) -> Self {
        guard let s = self as? _ColspanAttrable else { return self }
        s.setAttribute("colspan", value)
        return self
    }
    
    /// The colspan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/colspan)
    @discardableResult
    public func colspan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        colspan(value.stateValue.wrappedValue)
        value.stateValue.listen { self.colspan($0) }
        return self
    }
}

extension Td: _ColspanAttrable {}
extension Th: _ColspanAttrable {}
