//
//  SpanAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SpanAttrable {
    @discardableResult
    func span(_ value: Int) -> Self
    @discardableResult
    func span(_ value: State<Int>) -> Self
    @discardableResult
    func span<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _SpanAttrable: _AnyElement, SpanAttrable {}

extension SpanAttrable {
    /// The span attribute defines the number of columns a <col>/<colgroup> element should span.
    ///
    /// Applicable to <col>, <colgroup>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_span.asp)
    @discardableResult
    public func span(_ value: Int) -> Self {
        guard let s = self as? _SpanAttrable else { return self }
        s.domElement.span = value.jsValue()
        return self
    }
    
    /// The span attribute defines the number of columns a <col>/<colgroup> element should span.
    ///
    /// Applicable to <col>, <colgroup>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_span.asp)
    @discardableResult
    public func span(_ value: State<Int>) -> Self {
        value.listen { self.span($0) }
        return self
    }
    
    /// The span attribute defines the number of columns a <col>/<colgroup> element should span.
    ///
    /// Applicable to <col>, <colgroup>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_span.asp)
    @discardableResult
    public func span<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        span(expressable.unwrap())
    }
}

extension Col: _SpanAttrable {}
extension ColGroup: _SpanAttrable {}
