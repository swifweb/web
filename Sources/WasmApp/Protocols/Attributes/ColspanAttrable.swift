//
//  ColspanAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ColspanAttrable {
    @discardableResult
    func colspan(_ value: Int) -> Self
    @discardableResult
    func colspan(_ value: State<Int>) -> Self
    @discardableResult
    func colspan<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _ColspanAttrable: _AnyElement, ColspanAttrable {}

extension ColspanAttrable {
    /// The colspan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/colspan)
    @discardableResult
    public func colspan(_ value: Int) -> Self {
        guard let s = self as? _ColspanAttrable else { return self }
        s.domElement.colspan = value.jsValue()
        return self
    }
    
    /// The colspan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/colspan)
    @discardableResult
    public func colspan(_ value: State<Int>) -> Self {
        value.listen { self.colspan($0) }
        return self
    }
    
    /// The colspan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/colspan)
    @discardableResult
    public func colspan<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        colspan(expressable.unwrap())
    }
}

extension Td: _ColspanAttrable {}
extension Th: _ColspanAttrable {}
