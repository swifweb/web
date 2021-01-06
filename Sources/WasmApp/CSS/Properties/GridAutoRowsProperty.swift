//
//  GridAutoRowsProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies a default row size
///
/// ```html
/// grid-auto-rows: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-auto-rows.asp)
public class GridAutoRowsProperty: _Property {
    public var propertyKey: PropertyKey<GridAutoRowsType> { .gridAutoRows }
    public var propertyValue: GridAutoRowsType
    var _content = _PropertyContent<GridAutoRowsType>()
    
    public init (_ type: GridAutoRowsType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var gridAutoRows: PropertyKey<GridAutoRowsType> { "grid-auto-rows".propertyKey() }
}
