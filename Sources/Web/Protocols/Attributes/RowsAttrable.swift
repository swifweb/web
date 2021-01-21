//
//  RowsAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol RowsAttrable {
    @discardableResult
    func rows(_ value: Int) -> Self
    @discardableResult
    func rows(_ value: State<Int>) -> Self
    @discardableResult
    func rows<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _RowsAttrable: _AnyElement, RowsAttrable {}

extension RowsAttrable {
    /// Defines the number of rows in a textarea.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rows)
    @discardableResult
    public func rows(_ value: Int) -> Self {
        guard let s = self as? _RowsAttrable else { return self }
        s.domElement.rows = value.jsValue()
        return self
    }
    
    /// Defines the number of rows in a textarea.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rows)
    @discardableResult
    public func rows(_ value: State<Int>) -> Self {
        value.listen { self.rows($0) }
        return self
    }
    
    /// Defines the number of rows in a textarea.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rows)
    @discardableResult
    public func rows<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        rows(expressable.unwrap())
    }
}

extension TextArea: _RowsAttrable {}
