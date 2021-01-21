//
//  GridAutoRowsProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public convenience init (_ type: State<GridAutoRowsType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, GridAutoRowsType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies a default row size
    public static var gridAutoRows: PropertyKey<GridAutoRowsType> { "grid-auto-rows".propertyKey() }
}

extension Stylesheet {
    /// Specifies a default row size
    public typealias GridAutoRows = GridAutoRowsProperty
}

extension CSSRulable {
    /// Specifies a default row size
    public func gridAutoRows(_ type: GridAutoRowsType) -> Self {
        s?._addProperty(.gridAutoRows, type)
        return self
    }

    /// Specifies a default row size
    public func gridAutoRows(_ type: State<GridAutoRowsType>) -> Self {
        s?._addProperty(GridAutoRowsProperty(type))
        return self
    }

    /// Specifies a default row size
    public func gridAutoRows<V>(_ type: ExpressableState<V, GridAutoRowsType>) -> Self {
        gridAutoRows(type.unwrap())
    }
    
    /// Specifies a default row size
    public func gridAutoRows<U: UnitValuable>(_ type: U) -> Self {
        gridAutoRows(.length(type))
    }

    /// Specifies a default row size
    public func gridAutoRows<U: UnitValuable>(_ type: State<U>) -> Self {
        gridAutoRows(type.map { .length($0) })
    }

    /// Specifies a default row size
    public func gridAutoRows<V, U: UnitValuable>(_ type: ExpressableState<V, U>) -> Self {
        gridAutoRows(type.unwrap())
    }
}
