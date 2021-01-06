//
//  GridTemplateRowsProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the size of the rows in a grid layout
///
/// ```html
/// grid-template-rows: 100px 300px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-template-rows.asp)
public class GridTemplateRowsProperty: _Property {
    public var propertyKey: PropertyKey<GridTemplateRowsType> { .gridTemplateRows }
    public var propertyValue: GridTemplateRowsType
    var _content = _PropertyContent<GridTemplateRowsType>()
    
    public init (_ type: GridTemplateRowsType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var gridTemplateRows: PropertyKey<GridTemplateRowsType> { "grid-template-rows".propertyKey() }
}
