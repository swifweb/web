//
//  GridTemplate.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for the grid-template-rows, grid-template-columns and grid-areas properties
///
/// ```html
/// grid-template: 150px / auto auto auto;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template)
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-template.asp)
public class GridTemplateProperty: _Property {
    public var propertyKey: PropertyKey<GridTemplateValue> { .gridTemplate }
    public var propertyValue: GridTemplateValue
    var _content = _PropertyContent<GridTemplateValue>()
    
    public init (_ value: GridTemplateValue) {
        propertyValue = value
    }
    
    public init (rows: GridTemplateRowsType, columns: GridTemplateColumnsType) {
        propertyValue = GridTemplateValue(rows: rows, columns: columns)
    }
    
    public init (_ area: String...) {
        propertyValue = GridTemplateValue(area)
    }
    
    public init (_ area: [String]) {
        propertyValue = GridTemplateValue(area)
    }
}

extension PropertyKey {
    public static var gridTemplate: PropertyKey<GridTemplateValue> { "grid-template".propertyKey() }
}

public struct GridTemplateValue: CustomStringConvertible {
    let value: String
    
    public init (rows: GridTemplateRowsType, columns: GridTemplateColumnsType) {
        value = [rows.value, columns.value].joined(separator: " / ")
    }
    
    public init (_ area: String...) {
        value = "\"\(area.joined(separator: " "))\""
    }
    
    public init (_ area: [String]) {
        value = "\"\(area.joined(separator: " "))\""
    }
    
    public var description: String { value }
}
