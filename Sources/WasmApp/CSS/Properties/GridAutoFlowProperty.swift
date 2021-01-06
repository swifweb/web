//
//  GridAutoFlowProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies how auto-placed items are inserted in the grid
///
/// ```html
/// grid-auto-flow: column;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-auto-flow.asp)
public class GridAutoFlowProperty: _Property {
    public var propertyKey: PropertyKey<GridAutoFlowType> { .gridAutoFlow }
    public var propertyValue: GridAutoFlowType
    var _content = _PropertyContent<GridAutoFlowType>()
    
    public init (_ type: GridAutoFlowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var gridAutoFlow: PropertyKey<GridAutoFlowType> { "grid-auto-flow".propertyKey() }
}
