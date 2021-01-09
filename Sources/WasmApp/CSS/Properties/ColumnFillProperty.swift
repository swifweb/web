//
//  ColumnFill.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how to fill columns, balanced or not
///
/// ```html
/// column-fill: auto;
/// column-fill: balance;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-fill.asp)
public class ColumnFillProperty: _Property {
    public var propertyKey: PropertyKey<ColumnFillType> { .columnFill }
    public var propertyValue: ColumnFillType
    var _content = _PropertyContent<ColumnFillType>()
    
    public init (_ type: ColumnFillType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ColumnFillType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ColumnFillType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how to fill columns, balanced or not
    public static var columnFill: PropertyKey<ColumnFillType> { "column-fill".propertyKey() }
}

extension Stylesheet {
    /// Specifies how to fill columns, balanced or not
    public typealias ColumnFill = ColumnFillProperty
}

extension CSSRulable {
    /// Specifies how to fill columns, balanced or not
    public func columnFill(_ type: ColumnFillType) -> Self {
        s?._addProperty(.columnFill, type)
        return self
    }

    /// Specifies how to fill columns, balanced or not
    public func columnFill(_ type: State<ColumnFillType>) -> Self {
        s?._addProperty(ColumnFillProperty(type))
        return self
    }

    /// Specifies how to fill columns, balanced or not
    public func columnFill<V>(_ type: ExpressableState<V, ColumnFillType>) -> Self {
        columnFill(type.unwrap())
    }
}
