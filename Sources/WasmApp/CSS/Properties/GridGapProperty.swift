//
//  GridGapProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the grid-row-gap and grid-column-gap properties
///
/// ```html
/// grid-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-gap.asp)
public class GridGapProperty: _Property {
    public var propertyKey: PropertyKey<GridGapValue> { .gridGap }
    public var propertyValue: GridGapValue
    var _content = _PropertyContent<GridGapValue>()
    
    public init (_ value: GridGapValue) {
        propertyValue = value
    }
    
    public init<R: UnitValuable>(_ rowGap: R) {
        propertyValue = .init(rowGap)
    }
    
    public init<R: UnitValuable, C: UnitValuable>(_ rowGap: R, _ columnGap: C) {
        propertyValue = .init(rowGap, columnGap)
    }
}

extension PropertyKey {
    public static var gridGap: PropertyKey<GridGapValue> { "grid-gap".propertyKey() }
}

public struct GridGapValue: CustomStringConvertible {
    public let value: String
    
    public init<R: UnitValuable>(_ rowGap: R) {
        value = rowGap.description
    }
    
    public init<R: UnitValuable, C: UnitValuable>(_ rowGap: R, _ columnGap: C) {
        value = [rowGap.description, columnGap.description].joined(separator: " ")
    }
    
    public var description: String { value }
}
