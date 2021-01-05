//
//  EmptyCells.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not to display borders and background on empty cells in a table
///
/// ```html
/// empty-cells: hide;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_tab_empty-cells.asp)
public class EmptyCellsProperty: _Property {
    public var propertyKey: PropertyKey<EmptyCellsType> { .emptyCells }
    public var propertyValue: EmptyCellsType
    var _content = _PropertyContent<EmptyCellsType>()
    
    public init (_ type: EmptyCellsType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var emptyCells: PropertyKey<EmptyCellsType> { "empty-cells".propertyKey() }
}
