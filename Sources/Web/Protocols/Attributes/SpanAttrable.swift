//
//  SpanAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SpanAttrable {
    @discardableResult
    func span(_ value: Int) -> Self
    @discardableResult
    func span<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

protocol _SpanAttrable: _AnyElement, SpanAttrable {}

extension SpanAttrable {
    /// The span attribute defines the number of columns a `<col>`/`<colgroup>` element should span.
    ///
    /// Applicable to `<col>`, `<colgroup>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_span.asp)
    @discardableResult
    public func span(_ value: Int) -> Self {
        guard let s = self as? _SpanAttrable else { return self }
        s.setAttribute("span", value)
        return self
    }
    
    /// The span attribute defines the number of columns a `<col>`/`<colgroup>` element should span.
    ///
    /// Applicable to `<col>`, `<colgroup>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_span.asp)
    @discardableResult
    public func span<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        span(value.stateValue.wrappedValue)
        value.stateValue.listen { self.span($0) }
        return self
    }
}

extension Col: _SpanAttrable {}
extension ColGroup: _SpanAttrable {}
