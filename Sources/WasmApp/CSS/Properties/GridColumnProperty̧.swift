//
//  GridColumnProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the grid-column-start and the grid-column-end properties
///
/// ```html
/// grid-column: 1 / span 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column.asp)
public class GridColumnProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnValue> { .gridColumn }
    public var propertyValue: GridColumnValue
    var _content = _PropertyContent<GridColumnValue>()
    
    public init (_ value: GridColumnValue) {
        propertyValue = value
    }
    
    public init (start: Int, end: Int) {
        propertyValue = .init(start: start, end: end)
    }
}

extension PropertyKey {
    public static var gridColumn: PropertyKey<GridColumnValue> { "grid-column".propertyKey() }
}

public struct GridColumnValue: CustomStringConvertible {
    public let value: String
    
    public init (start: Int, end: Int) {
        value = "\(start) / \(end)"
    }
    
    public var description: String { value }
}
