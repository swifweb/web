//
//  TableLayout.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines the algorithm used to lay out table cells, rows, and columns
///
/// ```html
/// table-layout: auto;
/// table-layout: fixed;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_tab_table-layout.asp)
public class TableLayoutProperty: _Property {
    public var propertyKey: PropertyKey<TableLayoutType> { .tableLayout }
    public var propertyValue: TableLayoutType
    var _content = _PropertyContent<TableLayoutType>()
    
    public init (_ type: TableLayoutType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var tableLayout: PropertyKey<TableLayoutType> { "table-layout".propertyKey() }
}
