//
//  GridTemplateRowsProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public convenience init (_ type: State<GridTemplateRowsType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, GridTemplateRowsType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the size of the rows in a grid layout
    public static var gridTemplateRows: PropertyKey<GridTemplateRowsType> { "grid-template-rows".propertyKey() }
}

extension Stylesheet {
    /// Specifies the size of the rows in a grid layout
    public typealias GridTemplateRows = GridTemplateRowsProperty
}

extension CSSRulable {
    /// Specifies the size of the rows in a grid layout
    public func gridTemplateRows(_ type: GridTemplateRowsType) -> Self {
        s?._addProperty(.gridTemplateRows, type)
        return self
    }

    /// Specifies the size of the rows in a grid layout
    public func gridTemplateRows(_ type: State<GridTemplateRowsType>) -> Self {
        s?._addProperty(GridTemplateRowsProperty(type))
        return self
    }

    /// Specifies the size of the rows in a grid layout
    public func gridTemplateRows<V>(_ type: ExpressableState<V, GridTemplateRowsType>) -> Self {
        gridTemplateRows(type.unwrap())
    }
}
