//
//  Columns.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for column-width and column-count
///
/// ```html
/// columns: 100px 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_columns.asp)
public class ColumnsProperty: _Property {
    public var propertyKey: PropertyKey<ColumnsValue> { .columns }
    public var propertyValue: ColumnsValue
    var _content = _PropertyContent<ColumnsValue>()
    
    public init<U: UnitValuable>(width: U, count: Int) {
        propertyValue = ColumnsValue(width: width, count: count)
    }
}

extension PropertyKey {
    public static var columns: PropertyKey<ColumnsValue> { "columns".propertyKey() }
}

public struct ColumnsValue: CustomStringConvertible {
    public let value: String
    
    public init<U: UnitValuable>(width: U, count: Int) {
        value = width.description + " \(count)"
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for column-width and column-count
    public typealias Columns = ColumnsProperty
}

extension CSSRulable {
    /// A shorthand property for column-width and column-count
    public func columns<U: UnitValuable>(width: U, count: Int) -> Self {
        s?._addProperty(ColumnsProperty(width: width, count: count))
        return self
    }
}
