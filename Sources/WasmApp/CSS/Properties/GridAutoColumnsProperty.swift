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
