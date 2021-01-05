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

/// Either specifies a name for the grid item, or this property is a shorthand property
/// for the grid-row-start, grid-column-start, grid-row-end, and grid-column-end properties
///
/// ```html
/// grid-area: 2 / 1 / span 2 / span 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-area.asp)
public class GridAreaProperty: _Property {
    public var propertyKey: PropertyKey<GridAreaValue> { .gridArea }
    public var propertyValue: GridAreaValue
    var _content = _PropertyContent<GridAreaValue>()
    
    public init (_ value: GridAreaValue) {
        propertyValue = value
    }
    
    public init (rowStart: GridRowStartValue, columnStart: GridColumnStartValue, rowEnd: GridRowEndValue, columnEnd: GridColumnEndValue) {
        propertyValue = .init(rowStart: rowStart, columnStart: columnStart, rowEnd: rowEnd, columnEnd: columnEnd)
    }
    
    public init (_ area: String) {
        propertyValue = .init(area)
    }
}

extension PropertyKey {
    public static var gridArea: PropertyKey<GridAreaValue> { "grid-area".propertyKey() }
}

public struct GridAreaValue: CustomStringConvertible {
    public let value: String
    
    public init (rowStart: GridRowStartValue, columnStart: GridColumnStartValue, rowEnd: GridRowEndValue, columnEnd: GridColumnEndValue) {
        value = rowStart.value + " / " + columnStart.value + " / " + rowEnd.value + " / " + columnEnd.value
    }
    
    public init (_ area: String) {
        value = area
    }
    
    public var description: String { value }
}

/// Specifies a default column size
///
/// ```html
/// grid-auto-columns: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-auto-columns.asp)
/// [Learn even more](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-columns)
public class GridAutoColumnsProperty: _Property {
    public var propertyKey: PropertyKey<GridAutoColumnsValue> { .gridAutoColumns }
    public var propertyValue: GridAutoColumnsValue
    var _content = _PropertyContent<GridAutoColumnsValue>()
    
    public init (_ type: GridAutoColumnsType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [GridAutoColumnsType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var gridAutoColumns: PropertyKey<GridAutoColumnsValue> { "grid-auto-columns".propertyKey() }
}

public struct GridAutoColumnsValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: GridAutoColumnsType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [GridAutoColumnsType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}

/// Specifies how auto-placed items are inserted in the grid
///
/// ```html
/// grid-auto-flow: column;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-auto-flow.asp)
public class GridAutoFlowProperty: _Property {
    public var propertyKey: PropertyKey<GridAutoFlowType> { .gridAutoFlow }
    public var propertyValue: GridAutoFlowType
    var _content = _PropertyContent<GridAutoFlowType>()
    
    public init (_ type: GridAutoFlowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var gridAutoFlow: PropertyKey<GridAutoFlowType> { "grid-auto-flow".propertyKey() }
}

/// Specifies a default row size
///
/// ```html
/// grid-auto-rows: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-auto-rows.asp)
public class GridAutoRowsProperty: _Property {
    public var propertyKey: PropertyKey<GridAutoRowsType> { .gridAutoRows }
    public var propertyValue: GridAutoRowsType
    var _content = _PropertyContent<GridAutoRowsType>()
    
    public init (_ type: GridAutoRowsType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var gridAutoRows: PropertyKey<GridAutoRowsType> { "grid-auto-rows".propertyKey() }
}

/// A shorthand property for the grid-column-start and the grid-column-end properties
///
/// ```html
/// grid-column: 1 / span 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column.asp)
public class GridColumnProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnValue> { .gridColumn }
    public var propertyValue: GridColumnValue
    var _content = _PropertyContent<GridColumnValue>()
    
    public init (_ value: GridColumnValue) {
        propertyValue = value
    }
    
    public init (start: Int, end: Int) {
        propertyValue = .init(start: start, end: end)
    }
}

extension PropertyKey {
    public static var gridColumn: PropertyKey<GridColumnValue> { "grid-column".propertyKey() }
}

public struct GridColumnValue: CustomStringConvertible {
    public let value: String
    
    public init (start: Int, end: Int) {
        value = "\(start) / \(end)"
    }
    
    public var description: String { value }
}

/// Specifies where to end the grid item
///
/// ```html
/// grid-column-end: span 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-end.asp)
public class GridColumnEndProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnEndValue> { .gridColumnEnd }
    public var propertyValue: GridColumnEndValue
    var _content = _PropertyContent<GridColumnEndValue>()
    
    public init (_ value: GridColumnEndValue) {
        propertyValue = value
    }
    
    public init() {
        propertyValue = .auto
    }
    
    public init (span n: Int) {
        propertyValue = .span(n)
    }
    
    public init (columnLine: Int) {
        propertyValue = .columnLine(columnLine)
    }
    
    public static var auto: GridColumnEndProperty { .init() }
    public static func span(_ n: Int) -> GridColumnEndProperty { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnEndProperty { .init(columnLine: v) }
}

extension PropertyKey {
    public static var gridColumnEnd: PropertyKey<GridColumnEndValue> { "grid-column-end".propertyKey() }
}

public struct GridColumnEndValue: CustomStringConvertible {
    public let value: String
    
    public init() {
        value = "auto"
    }
    
    public init (span n: Int) {
        value = "\(n)"
    }
    
    public init (columnLine: Int) {
        value = "\(columnLine)"
    }
    
    public static var auto: GridColumnEndValue { .init() }
    public static func span(_ n: Int) -> GridColumnEndValue { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnEndValue { .init(columnLine: v) }
    
    public var description: String { value }
}

/// Specifies the size of the gap between columns
///
/// ```html
/// grid-column-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-gap.asp)
public class GridColumnGapProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .gridColumnGap }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var gridColumnGap: PropertyKey<UnitValue> { "grid-column-gap".propertyKey() }
}

/// Specifies where to start the grid item
///
/// ```html
/// grid-column-start: 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-start.asp)
public class GridColumnStartProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnStartValue> { .gridColumnStart }
    public var propertyValue: GridColumnStartValue
    var _content = _PropertyContent<GridColumnStartValue>()
    
    public init (_ value: GridColumnStartValue) {
        propertyValue = value
    }
    
    public init() {
        propertyValue = .auto
    }
    
    public init (span n: Int) {
        propertyValue = .span(n)
    }
    
    public init (columnLine: Int) {
        propertyValue = .columnLine(columnLine)
    }
    
    public static var auto: GridColumnStartProperty { .init() }
    public static func span(_ n: Int) -> GridColumnStartProperty { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnStartProperty { .init(columnLine: v) }
}

extension PropertyKey {
    public static var gridColumnStart: PropertyKey<GridColumnStartValue> { "grid-column-start".propertyKey() }
}

public struct GridColumnStartValue: CustomStringConvertible {
    public let value: String
    
    public init() {
        value = "auto"
    }
    
    public init (span n: Int) {
        value = "\(n)"
    }
    
    public init (columnLine: Int) {
        value = "\(columnLine)"
    }
    
    public static var auto: GridColumnStartValue { .init() }
    public static func span(_ n: Int) -> GridColumnStartValue { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridColumnStartValue { .init(columnLine: v) }
    
    public var description: String { value }
}

/// A shorthand property for the grid-row-gap and grid-column-gap properties
///
/// ```html
/// grid-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-gap.asp)
public class GridGapProperty: _Property {
    public var propertyKey: PropertyKey<GridGapValue> { .gridGap }
    public var propertyValue: GridGapValue
    var _content = _PropertyContent<GridGapValue>()
    
    public init (_ value: GridGapValue) {
        propertyValue = value
    }
    
    public init<R: UnitValuable>(_ rowGap: R) {
        propertyValue = .init(rowGap)
    }
    
    public init<R: UnitValuable, C: UnitValuable>(_ rowGap: R, _ columnGap: C) {
        propertyValue = .init(rowGap, columnGap)
    }
}

extension PropertyKey {
    public static var gridGap: PropertyKey<GridGapValue> { "grid-gap".propertyKey() }
}

public struct GridGapValue: CustomStringConvertible {
    public let value: String
    
    public init<R: UnitValuable>(_ rowGap: R) {
        value = rowGap.description
    }
    
    public init<R: UnitValuable, C: UnitValuable>(_ rowGap: R, _ columnGap: C) {
        value = [rowGap.description, columnGap.description].joined(separator: " ")
    }
    
    public var description: String { value }
}

/// A shorthand property for the grid-row-start and the grid-row-end properties
///
/// ```html
/// grid-row: 1 / span 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row.asp)
public class GridRowProperty: _Property {
    public var propertyKey: PropertyKey<GridRowValue> { .gridRow }
    public var propertyValue: GridRowValue
    var _content = _PropertyContent<GridRowValue>()
    
    public init (_ value: GridRowValue) {
        propertyValue = value
    }
    
    public init (start: Int, end: Int) {
        propertyValue = GridRowValue(start: start, end: end)
    }
}

extension PropertyKey {
    public static var gridRow: PropertyKey<GridRowValue> { "grid-row".propertyKey() }
}

public struct GridRowValue: CustomStringConvertible {
    public let value: String
    
    public init (start: Int, end: Int) {
        value = "\(start) / \(end)"
    }
    
    public var description: String { value }
}

/// Specifies where to end the grid item
///
/// ```html
/// grid-row-end: span 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row-end.asp)
public class GridRowEndProperty: _Property {
    public var propertyKey: PropertyKey<GridRowEndValue> { .gridRowEnd }
    public var propertyValue: GridRowEndValue
    var _content = _PropertyContent<GridRowEndValue>()
    
    public init (_ value: GridRowEndValue) {
        propertyValue = value
    }
    
    public init() {
        propertyValue = .auto
    }
    
    public init (span n: Int) {
        propertyValue = .span(n)
    }
    
    public init (columnLine: Int) {
        propertyValue = .columnLine(columnLine)
    }
    
    public static var auto: GridRowEndProperty { .init() }
    public static func span(_ n: Int) -> GridRowEndProperty { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridRowEndProperty { .init(columnLine: v) }
}

extension PropertyKey {
    public static var gridRowEnd: PropertyKey<GridRowEndValue> { "grid-row-end".propertyKey() }
}

public struct GridRowEndValue: CustomStringConvertible {
    let value: String
    
    public init() {
        value = "auto"
    }
    
    public init (span n: Int) {
        value = "\(n)"
    }
    
    public init (columnLine: Int) {
        value = "\(columnLine)"
    }
    
    public static var auto: GridRowEndValue { .init() }
    public static func span(_ n: Int) -> GridRowEndValue { .init(span: n) }
    public static func columnLine(_ v: Int) -> GridRowEndValue { .init(columnLine: v) }
    
    public var description: String { value }
}

/// Specifies the size of the gap between rows
///
/// ```html
/// grid-row-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row-gap.asp)
public class GridRowGapProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .gridRowGap }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var gridRowGap: PropertyKey<UnitValue> { "grid-row-gap".propertyKey() }
}

/// Specifies where to start the grid item
///
/// ```html
/// grid-row-start: 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row-start.asp)
public class GridRowStartProperty: _Property {
    public var propertyKey: PropertyKey<GridRowStartValue> { .gridRowStart }
    public var propertyValue: GridRowStartValue
    var _content = _PropertyContent<GridRowStartValue>()
    
    public init() {
        propertyValue = .auto
    }
    
    public init (rowLine: Int) {
        propertyValue = .rowLine(rowLine)
    }
    
    public static var auto: GridRowStartProperty { .init() }
    public static func rowLine(_ v: Int) -> GridRowStartProperty { .init(rowLine: v) }
}

extension PropertyKey {
    public static var gridRowStart: PropertyKey<GridRowStartValue> { "grid-row-start".propertyKey() }
}

public struct GridRowStartValue: CustomStringConvertible {
    public let value: String
    
    public init() {
        value = "auto"
    }
    
    public init (rowLine: Int) {
        value = "\(rowLine)"
    }
    
    public static var auto: GridRowStartValue { .init() }
    public static func rowLine(_ v: Int) -> GridRowStartValue { .init(rowLine: v) }
    
    public var description: String { value }
}

/// Specifies how to display columns and rows, using named grid items
///
/// ```html
/// .item1 {
///     grid-area: myArea;
/// }
/// .grid-container {
///     display: grid;
///     grid-template-areas: "myArea myArea . . .";
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-template-areas.asp)
public class GridTemplateAreasProperty: _Property {
    public var propertyKey: PropertyKey<String> { .gridTemplateAreas }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ area: String...) {
        propertyValue = "\"\(area.joined(separator: " "))\""
    }
    
    public init (_ area: [String]) {
        propertyValue = "\"\(area.joined(separator: " "))\""
    }
}

extension PropertyKey {
    public static var gridTemplateAreas: PropertyKey<String> { "grid-template-areas".propertyKey() }
}

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
