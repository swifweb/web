//
//  ColumnCount.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the number of columns an element should be divided into
///
/// ```html
/// column-count: 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-count.asp)
public class ColumnCountProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .columnCount }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ n: Int) {
        propertyValue = n
    }
}

extension PropertyKey {
    public static var columnCount: PropertyKey<Int> { "column-count".propertyKey() }
}
