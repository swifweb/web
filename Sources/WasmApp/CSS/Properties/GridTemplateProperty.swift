//
//  GridTemplate.swift
//  WasmApp
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
    /// A shorthand property for the grid-template-rows, grid-template-columns and grid-areas properties
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

extension Stylesheet {
    /// A shorthand property for the grid-template-rows, grid-template-columns and grid-areas properties
    public typealias GridTemplate = GridTemplateProperty
}

extension CSSRulable {
    /// A shorthand property for the grid-template-rows, grid-template-columns and grid-areas properties
    public func gridTemplate(rows: GridTemplateRowsType, columns: GridTemplateColumnsType) -> Self {
        s?._addProperty(GridTemplateProperty(rows: rows, columns: columns))
        return self
    }
    
    /// A shorthand property for the grid-template-rows, grid-template-columns and grid-areas properties
    public func gridTemplate<U: UnitValuable>(rows: U, columns: GridTemplateColumnsType) -> Self {
        gridTemplate(rows: .length(rows), columns: columns)
    }
    
    /// A shorthand property for the grid-template-rows, grid-template-columns and grid-areas properties
    public func gridTemplate(_ area: String...) -> Self {
        gridTemplate(area)
    }
    
    /// A shorthand property for the grid-template-rows, grid-template-columns and grid-areas properties
    public func gridTemplate(_ area: [String]) -> Self {
        s?._addProperty(GridTemplateProperty(area))
        return self
    }
}
