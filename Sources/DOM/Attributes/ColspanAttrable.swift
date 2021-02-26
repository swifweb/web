//
//  ColspanAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ColspanAttrable: DOMElement {
    @discardableResult
    func colspan(_ value: Int) -> Self
    @discardableResult
    func colspan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension ColspanAttrable {
    /// The colspan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/colspan)
    @discardableResult
    public func colspan(_ value: Int) -> Self {
        setAttribute("colspan", value)
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

extension Td: ColspanAttrable {}
extension Th: ColspanAttrable {}
