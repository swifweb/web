//
//  GridTemplateColumnsProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public convenience init (_ type: State<GridTemplateColumnsType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, GridTemplateColumnsType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the size of the columns, and how many columns in a grid layout
    public static var gridTemplateColumns: PropertyKey<GridTemplateColumnsType> { "grid-template-columns".propertyKey() }
}

extension Stylesheet {
    /// Specifies the size of the columns, and how many columns in a grid layout
    public typealias GridTemplateColumns = GridTemplateColumnsProperty
}

extension CSSRulable {
    /// Specifies the size of the columns, and how many columns in a grid layout
    public func gridTemplateColumns(_ type: GridTemplateColumnsType) -> Self {
        s?._addProperty(.gridTemplateColumns, type)
        return self
    }

    /// Specifies the size of the columns, and how many columns in a grid layout
    public func gridTemplateColumns(_ type: State<GridTemplateColumnsType>) -> Self {
        s?._addProperty(GridTemplateColumnsProperty(type))
        return self
    }

    /// Specifies the size of the columns, and how many columns in a grid layout
    public func gridTemplateColumns<V>(_ type: ExpressableState<V, GridTemplateColumnsType>) -> Self {
        gridTemplateColumns(type.unwrap())
    }
}
