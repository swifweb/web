//
//  ColumnSpan.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how many columns an element should span across
///
/// ```html
/// column-span: all;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-span.asp)
public class ColumnSpanProperty: _Property {
    public var propertyKey: PropertyKey<ColumnSpanType> { .columnSpan }
    public var propertyValue: ColumnSpanType
    var _content = _PropertyContent<ColumnSpanType>()
    
    public init (_ type: ColumnSpanType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ColumnSpanType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ColumnSpanType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how many columns an element should span across
    public static var columnSpan: PropertyKey<ColumnSpanType> { "column-span".propertyKey() }
}

extension Stylesheet {
    /// Specifies how many columns an element should span across
    public typealias ColumnSpan = ColumnSpanProperty
}

extension CSSRulable {
    /// Specifies how many columns an element should span across
    public func columnSpan(_ type: ColumnSpanType) -> Self {
        s?._addProperty(.columnSpan, type)
        return self
    }

    /// Specifies how many columns an element should span across
    public func columnSpan(_ type: State<ColumnSpanType>) -> Self {
        s?._addProperty(ColumnSpanProperty(type))
        return self
    }

    /// Specifies how many columns an element should span across
    public func columnSpan<V>(_ type: ExpressableState<V, ColumnSpanType>) -> Self {
        columnSpan(type.unwrap())
    }
}
