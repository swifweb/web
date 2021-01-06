//
//  GridAutoFlowProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public convenience init (_ type: State<GridAutoFlowType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, GridAutoFlowType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how auto-placed items are inserted in the grid
    public static var gridAutoFlow: PropertyKey<GridAutoFlowType> { "grid-auto-flow".propertyKey() }
}

extension Stylesheet {
    /// Specifies how auto-placed items are inserted in the grid
    public typealias GridAutoFlow = GridAutoFlowProperty
}

extension CSSRulable {
    /// Specifies how auto-placed items are inserted in the grid
    public func gridAutoFlow(_ type: GridAutoFlowType) -> Self {
        s?._addProperty(.gridAutoFlow, type)
        return self
    }

    /// Specifies how auto-placed items are inserted in the grid
    public func gridAutoFlow(_ type: State<GridAutoFlowType>) -> Self {
        s?._addProperty(GridAutoFlowProperty(type))
        return self
    }

    /// Specifies how auto-placed items are inserted in the grid
    public func gridAutoFlow<V>(_ type: ExpressableState<V, GridAutoFlowType>) -> Self {
        gridAutoFlow(type.unwrap())
    }
}
