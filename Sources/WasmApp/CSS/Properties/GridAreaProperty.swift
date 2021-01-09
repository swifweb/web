//
//  GridAreaProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public init (rowStart: GridRowStartValue, columnStart: GridColumnStartValue, rowEnd: GridRowEndValue, columnEnd: GridColumnEndValue) {
        propertyValue = .init(rowStart: rowStart, columnStart: columnStart, rowEnd: rowEnd, columnEnd: columnEnd)
    }
    
    public init (_ area: String) {
        propertyValue = .init(area)
    }
    
    public convenience init <S>(_ area: S) where S: StateConvertible, S.Value == String {
        let area = area.stateValue
        self.init(area.wrappedValue)
        area.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Either specifies a name for the grid item, or this property is a shorthand property
    /// for the grid-row-start, grid-column-start, grid-row-end, and grid-column-end properties
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

extension Stylesheet {
    /// Either specifies a name for the grid item, or this property is a shorthand property
    /// for the grid-row-start, grid-column-start, grid-row-end, and grid-column-end properties
    public typealias GridArea = GridAreaProperty
}

extension CSSRulable {
    /// Either specifies a name for the grid item, or this property is a shorthand property
    /// for the grid-row-start, grid-column-start, grid-row-end, and grid-column-end properties
    public func gridArea(rowStart: GridRowStartValue, columnStart: GridColumnStartValue, rowEnd: GridRowEndValue, columnEnd: GridColumnEndValue) -> Self {
        s?._addProperty(GridAreaProperty(rowStart: rowStart, columnStart: columnStart, rowEnd: rowEnd, columnEnd: columnEnd))
        return self
    }
    
    /// Either specifies a name for the grid item, or this property is a shorthand property
    /// for the grid-row-start, grid-column-start, grid-row-end, and grid-column-end properties
    public func gridArea(_ area: String) -> Self {
        s?._addProperty(GridAreaProperty(area))
        return self
    }
    
    /// Either specifies a name for the grid item, or this property is a shorthand property
    /// for the grid-row-start, grid-column-start, grid-row-end, and grid-column-end properties
    public func gridArea<S>(_ area: S) -> Self where S: StateConvertible, S.Value == String {
        s?._addProperty(GridAreaProperty(area))
        return self
    }
}
