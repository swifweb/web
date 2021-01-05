//
//  ColumnSpan.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how many columns an element should span across
///
/// ```html
/// column-span: all;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-span.asp)
public class ColumnSpanProperty: _Property {
    public var propertyKey: PropertyKey<ColumnSpanType> { .columnSpan }
    public var propertyValue: ColumnSpanType
    var _content = _PropertyContent<ColumnSpanType>()
    
    public init (_ type: ColumnSpanType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var columnSpan: PropertyKey<ColumnSpanType> { "column-span".propertyKey() }
}
