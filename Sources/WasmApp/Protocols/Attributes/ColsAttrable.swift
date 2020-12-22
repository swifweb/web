//
//  ColsAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ColsAttrable {
    @discardableResult
    func cols(_ value: Int) -> Self
    @discardableResult
    func cols(_ value: State<Int>) -> Self
    @discardableResult
    func cols<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _ColsAttrable: _AnyElement, ColsAttrable {}

extension ColsAttrable {
    /// Defines the number of columns in a textarea.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/cols)
    @discardableResult
    public func cols(_ value: Int) -> Self {
        guard let s = self as? _ColsAttrable else { return self }
        s.domElement.cols = value.jsValue()
        return self
    }
    
    /// Defines the number of columns in a textarea.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/cols)
    @discardableResult
    public func cols(_ value: State<Int>) -> Self {
        value.listen { self.cols($0) }
        return self
    }
    
    /// Defines the number of columns in a textarea.
    ///
    /// Applicable to <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/cols)
    @discardableResult
    public func cols<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        cols(expressable.unwrap())
    }
}

extension TextArea: _ColsAttrable {}
