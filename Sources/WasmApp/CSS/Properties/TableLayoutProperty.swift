//
//  TableLayout.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines the algorithm used to lay out table cells, rows, and columns
///
/// ```html
/// table-layout: auto;
/// table-layout: fixed;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_tab_table-layout.asp)
public class TableLayoutProperty: _Property {
    public var propertyKey: PropertyKey<TableLayoutType> { .tableLayout }
    public var propertyValue: TableLayoutType
    var _content = _PropertyContent<TableLayoutType>()
    
    public init (_ type: TableLayoutType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TableLayoutType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TableLayoutType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines the algorithm used to lay out table cells, rows, and columns
    public static var tableLayout: PropertyKey<TableLayoutType> { "table-layout".propertyKey() }
}

extension Stylesheet {
    /// Defines the algorithm used to lay out table cells, rows, and columns
    public typealias TableLayout = TableLayoutProperty
}

extension CSSRulable {
    /// Defines the algorithm used to lay out table cells, rows, and columns
    public func tableLayout(_ type: TableLayoutType) -> Self {
        s?._addProperty(.tableLayout, type)
        return self
    }

    /// Defines the algorithm used to lay out table cells, rows, and columns
    public func tableLayout(_ type: State<TableLayoutType>) -> Self {
        s?._addProperty(TableLayoutProperty(type))
        return self
    }

    /// Defines the algorithm used to lay out table cells, rows, and columns
    public func tableLayout<V>(_ type: ExpressableState<V, TableLayoutType>) -> Self {
        tableLayout(type.unwrap())
    }
}
