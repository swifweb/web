//
//  ColumnFill.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how to fill columns, balanced or not
///
/// ```html
/// column-fill: auto;
/// column-fill: balance;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-fill.asp)
public class ColumnFillProperty: _Property {
    public var propertyKey: PropertyKey<ColumnFillType> { .columnFill }
    public var propertyValue: ColumnFillType
    var _content = _PropertyContent<ColumnFillType>()
    
    public init (_ type: ColumnFillType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var columnFill: PropertyKey<ColumnFillType> { "column-fill".propertyKey() }
}
