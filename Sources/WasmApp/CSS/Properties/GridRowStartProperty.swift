//
//  GridRowStartProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies where to start the grid item
///
/// ```html
/// grid-row-start: 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row-start.asp)
public class GridRowStartProperty: _Property {
    public var propertyKey: PropertyKey<GridRowStartValue> { .gridRowStart }
    public var propertyValue: GridRowStartValue
    var _content = _PropertyContent<GridRowStartValue>()
    
    public init() {
        propertyValue = .auto
    }
    
    public init (rowLine: Int) {
        propertyValue = .rowLine(rowLine)
    }
    
    public static var auto: GridRowStartProperty { .init() }
    public static func rowLine(_ v: Int) -> GridRowStartProperty { .init(rowLine: v) }
}

extension PropertyKey {
    public static var gridRowStart: PropertyKey<GridRowStartValue> { "grid-row-start".propertyKey() }
}

public struct GridRowStartValue: CustomStringConvertible {
    public let value: String
    
    public init() {
        value = "auto"
    }
    
    public init (rowLine: Int) {
        value = "\(rowLine)"
    }
    
    public static var auto: GridRowStartValue { .init() }
    public static func rowLine(_ v: Int) -> GridRowStartValue { .init(rowLine: v) }
    
    public var description: String { value }
}
