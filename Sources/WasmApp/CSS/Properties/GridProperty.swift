//
//  Grid.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// A shorthand property for the grid-template-rows, grid-template-columns,
/// grid-template-areas, grid-auto-rows, grid-auto-columns, and the grid-auto-flow properties
///
/// ```html
/// grid: 150px / auto auto auto;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid.asp)
public class GridProperty: _Property {
    public var propertyKey: PropertyKey<GridValue> { .grid }
    public var propertyValue: GridValue
    var _content = _PropertyContent<GridValue>()
    
    public init (_ value: GridValue) {
        propertyValue = value
    }
    
    /// Specifies the size(s) of the columns and rows
    public init (templateRows: GridTemplateRowsType, templateColumns: GridTemplateColumnsType) {
        propertyValue = GridValue(templateRows: templateRows, templateColumns: templateColumns)
    }
    
    /// Specifies the grid layout using named items
    public init (_ area: String...) {
        propertyValue = GridValue(area)
    }
    
    /// Specifies the grid layout using named items
    public init (_ area: [String]) {
        propertyValue = GridValue(area)
    }
    
    /// Specifies the size (height) of the rows, and the auto size of the columns
    public init (templateRows: GridTemplateRowsType, autoColumns: GridAutoColumnsValue) {
        propertyValue = GridValue(templateRows: templateRows, autoColumns: autoColumns)
    }
    
    /// Specifies the auto size of the rows, and sets the grid-template-columns property
    public init (autoRows: GridAutoRowsType, templateColumns: GridTemplateColumnsType) {
        propertyValue = GridValue(autoRows: autoRows, templateColumns: templateColumns)
    }
    
    /// Specifies the size (height) of the rows, and the auto size of the columns
    public init (templateRows: GridTemplateRowsType, autoFlow: GridAutoFlowType, autoColumns: GridAutoColumnsValue) {
        propertyValue = GridValue(templateRows: templateRows, autoFlow: autoFlow, autoColumns: autoColumns)
    }
    
    public init (autoFlow: GridAutoFlowType, autoRows: GridAutoRowsType, templateColumns: GridTemplateColumnsType) {
        propertyValue = GridValue(autoFlow: autoFlow, autoRows: autoRows, templateColumns: templateColumns)
    }
}

extension PropertyKey {
    public static var grid: PropertyKey<GridValue> { "grid".propertyKey() }
}

public struct GridValue: CustomStringConvertible {
    public let value: String
    
    /// Specifies the size(s) of the columns and rows
    public init (templateRows: GridTemplateRowsType, templateColumns: GridTemplateColumnsType) {
        value = templateRows.value + " / " + templateColumns.value
    }
    
    /// Specifies the grid layout using named items
    public init (_ area: String...) {
        value = "\"\(area.joined(separator: " "))\""
    }
    
    /// Specifies the grid layout using named items
    public init (_ area: [String]) {
        value = "\"\(area.joined(separator: " "))\""
    }
    
    /// Specifies the size (height) of the rows, and the auto size of the columns
    public init (templateRows: GridTemplateRowsType, autoColumns: GridAutoColumnsValue) {
        value = templateRows.value + " / " + autoColumns.value
    }
    
    /// Specifies the auto size of the rows, and sets the grid-template-columns property
    public init (autoRows: GridAutoRowsType, templateColumns: GridTemplateColumnsType) {
        value = autoRows.value + " / " + templateColumns.value
    }
    
    /// Specifies the size (height) of the rows, and the auto size of the columns
    public init (templateRows: GridTemplateRowsType, autoFlow: GridAutoFlowType, autoColumns: GridAutoColumnsValue) {
        value = templateRows.value + " / " + autoFlow.value + " " + autoColumns.value
    }
    
    public init (autoFlow: GridAutoFlowType, autoRows: GridAutoRowsType, templateColumns: GridTemplateColumnsType) {
        value = autoFlow.value + " " + autoRows.value + " / " + templateColumns.value
    }
    
    public var description: String { value }
}
