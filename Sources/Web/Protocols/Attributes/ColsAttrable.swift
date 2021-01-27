//
//  ColsAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ColsAttrable {
    @discardableResult
    func cols(_ value: Int) -> Self
    @discardableResult
    func cols<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

protocol _ColsAttrable: _AnyElement, ColsAttrable {}

extension ColsAttrable {
    /// Defines the number of columns in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/cols)
    @discardableResult
    public func cols(_ value: Int) -> Self {
        guard let s = self as? _ColsAttrable else { return self }
        s.setAttribute("cols", value)
        return self
    }
    
    /// Defines the number of columns in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/cols)
    @discardableResult
    public func cols<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        cols(value.stateValue.wrappedValue)
        value.stateValue.listen { self.cols($0) }
        return self
    }
}

extension TextArea: _ColsAttrable {}
