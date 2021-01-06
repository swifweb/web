//
//  GridRowProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the grid-row-start and the grid-row-end properties
///
/// ```html
/// grid-row: 1 / span 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row.asp)
public class GridRowProperty: _Property {
    public var propertyKey: PropertyKey<GridRowValue> { .gridRow }
    public var propertyValue: GridRowValue
    var _content = _PropertyContent<GridRowValue>()
    
    public init (_ value: GridRowValue) {
        propertyValue = value
    }
    
    public init (start: Int, end: Int) {
        propertyValue = GridRowValue(start: start, end: end)
    }
}

extension PropertyKey {
    public static var gridRow: PropertyKey<GridRowValue> { "grid-row".propertyKey() }
}

public struct GridRowValue: CustomStringConvertible {
    public let value: String
    
    public init (start: Int, end: Int) {
        value = "\(start) / \(end)"
    }
    
    public var description: String { value }
}
