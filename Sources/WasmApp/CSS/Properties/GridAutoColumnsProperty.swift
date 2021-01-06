//
//  GridAutoColumnsProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public convenience init (_ type: State<GridAutoColumnsType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: .init($0)) }
    }
    
    public convenience init (_ type: State<[GridAutoColumnsType]>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: .init($0)) }
    }

    public convenience init <V>(_ type: ExpressableState<V, [GridAutoColumnsType]>) {
        self.init(type.unwrap())
    }
    
    public convenience init <V>(_ type: ExpressableState<V, GridAutoColumnsType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies a default column size
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

extension Stylesheet {
    /// Specifies a default column size
    public typealias GridAutoColumns = GridAutoColumnsProperty
}

extension CSSRulable {
    /// Specifies a default column size
    public func gridAutoColumns(_ type: [GridAutoColumnsType]) -> Self {
        s?._addProperty(.gridAutoColumns, .init(type))
        return self
    }
    
    /// Specifies a default column size
    public func gridAutoColumns(_ type: GridAutoColumnsType...) -> Self {
        gridAutoColumns(type)
    }

    /// Specifies a default column size
    public func gridAutoColumns(_ type: State<[GridAutoColumnsType]>) -> Self {
        s?._addProperty(GridAutoColumnsProperty(type))
        return self
    }
    
    /// Specifies a default column size
    public func gridAutoColumns(_ type: State<GridAutoColumnsType>) -> Self {
        s?._addProperty(GridAutoColumnsProperty(type))
        return self
    }

    /// Specifies a default column size
    public func gridAutoColumns<V>(_ type: ExpressableState<V, [GridAutoColumnsType]>) -> Self {
        gridAutoColumns(type.unwrap())
    }
    
    /// Specifies a default column size
    public func gridAutoColumns<V>(_ type: ExpressableState<V, GridAutoColumnsType>) -> Self {
        gridAutoColumns(type.unwrap())
    }
}
