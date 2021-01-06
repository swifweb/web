//
//  GridTemplateColumnsProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the size of the columns, and how many columns in a grid layout
///
/// ```html
/// grid-template-columns: auto auto auto auto;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-template-columns.asp)
public class GridTemplateColumnsProperty: _Property {
    public var propertyKey: PropertyKey<GridTemplateColumnsType> { .gridTemplateColumns }
    public var propertyValue: GridTemplateColumnsType
    var _content = _PropertyContent<GridTemplateColumnsType>()
    
    public init (_ type: GridTemplateColumnsType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var gridTemplateColumns: PropertyKey<GridTemplateColumnsType> { "grid-template-columns".propertyKey() }
}
