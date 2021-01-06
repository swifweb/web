//
//  GridColumnStartPropertyGridColumnStartProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies where to start the grid item
///
/// ```html
/// grid-column-start: 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-start.asp)
public class GridColumnStartProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnStartValue> { .gridColumnStart }
    public var propertyValue: GridColumnStartValue
    var _content = _PropertyContent<GridColumnStartValue>()
    
    public init (_ value: GridColumnStartValue) {
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
    
    public static var auto: GridColumnStartProperty { .init() }
    public static func span(_ n: Int) -> GridColumnStartProperty { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnStartProperty { .init(columnLine: v) }
}

extension PropertyKey {
    public static var gridColumnStart: PropertyKey<GridColumnStartValue> { "grid-column-start".propertyKey() }
}

public struct GridColumnStartValue: CustomStringConvertible {
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
    
    public static var auto: GridColumnStartValue { .init() }
    public static func span(_ n: Int) -> GridColumnStartValue { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnStartValue { .init(columnLine: v) }
    
    public var description: String { value }
}
