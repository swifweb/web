//
//  ColumnCount.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the number of columns an element should be divided into
///
/// ```html
/// column-count: 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-count.asp)
public class ColumnCountProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .columnCount }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ n: Int) {
        propertyValue = n
    }
    
    public convenience init (_ type: State<Int>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, Int>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the number of columns an element should be divided into
    public static var columnCount: PropertyKey<Int> { "column-count".propertyKey() }
}

extension Stylesheet {
    /// Specifies the number of columns an element should be divided into
    public typealias ColumnCount = ColumnCountProperty
}

extension CSSRulable {
    /// Specifies the number of columns an element should be divided into
    public func columnCount(_ type: Int) -> Self {
        s?._addProperty(.columnCount, type)
        return self
    }

    /// Specifies the number of columns an element should be divided into
    public func columnCount(_ type: State<Int>) -> Self {
        s?._addProperty(ColumnCountProperty(type))
        return self
    }

    /// Specifies the number of columns an element should be divided into
    public func columnCount<V>(_ type: ExpressableState<V, Int>) -> Self {
        columnCount(type.unwrap())
    }
}
