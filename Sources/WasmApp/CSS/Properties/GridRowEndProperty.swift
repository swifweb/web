//
//  GridRowEndProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies where to end the grid item
///
/// ```html
/// grid-row-end: span 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row-end.asp)
public class GridRowEndProperty: _Property {
    public var propertyKey: PropertyKey<GridRowEndValue> { .gridRowEnd }
    public var propertyValue: GridRowEndValue
    var _content = _PropertyContent<GridRowEndValue>()
    
    public init (_ value: GridRowEndValue) {
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
    
    public static var auto: GridRowEndProperty { .init() }
    public static func span(_ n: Int) -> GridRowEndProperty { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridRowEndProperty { .init(columnLine: v) }
}

extension PropertyKey {
    public static var gridRowEnd: PropertyKey<GridRowEndValue> { "grid-row-end".propertyKey() }
}

public struct GridRowEndValue: CustomStringConvertible {
    let value: String
    
    public init() {
        value = "auto"
    }
    
    public init (span n: Int) {
        value = "\(n)"
    }
    
    public init (columnLine: Int) {
        value = "\(columnLine)"
    }
    
    public static var auto: GridRowEndValue { .init() }
    public static func span(_ n: Int) -> GridRowEndValue { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridRowEndValue { .init(columnLine: v) }
    
    public var description: String { value }
}
