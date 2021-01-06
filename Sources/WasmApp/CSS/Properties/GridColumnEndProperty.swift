//
//  GridColumnEndProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies where to end the grid item
///
/// ```html
/// grid-column-end: span 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-end.asp)
public class GridColumnEndProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnEndValue> { .gridColumnEnd }
    public var propertyValue: GridColumnEndValue
    var _content = _PropertyContent<GridColumnEndValue>()
    
    public init (_ value: GridColumnEndValue) {
        propertyValue = value
    }
    
    public init() {
        propertyValue = .auto
    }
    
    public init (span n: Int) {
        propertyValue = .span(n)
    }
    
    public init (columnLine: Int) {
        propertyValue = .columnLine(columnLine)
    }
    
    public static var auto: GridColumnEndProperty { .init() }
    public static func span(_ n: Int) -> GridColumnEndProperty { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnEndProperty { .init(columnLine: v) }
}

extension PropertyKey {
    public static var gridColumnEnd: PropertyKey<GridColumnEndValue> { "grid-column-end".propertyKey() }
}

public struct GridColumnEndValue: CustomStringConvertible {
    public let value: String
    
    public init() {
        value = "auto"
    }
    
    public init (span n: Int) {
        value = "\(n)"
    }
    
    public init (columnLine: Int) {
        value = "\(columnLine)"
    }
    
    public static var auto: GridColumnEndValue { .init() }
    public static func span(_ n: Int) -> GridColumnEndValue { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnEndValue { .init(columnLine: v) }
    
    public var description: String { value }
}
