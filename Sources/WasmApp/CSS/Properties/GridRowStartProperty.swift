//
//  GridRowStartProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    // Means `auto`
    public init() {
        propertyValue = .auto
    }
    
    public init (rowLine: Int) {
        propertyValue = .rowLine(rowLine)
    }
    
    public init <V>(rowLine: V) where V: StateConvertible, V.Value == Int {
        propertyValue = .rowLine(rowLine)
    }
    
    public static var auto: GridRowStartProperty { .init() }
    public static func rowLine(_ v: Int) -> GridRowStartProperty { .init(rowLine: v) }
    public static func rowLine<V>(_ v: V) -> GridRowStartProperty where V: StateConvertible, V.Value == Int { .init(rowLine: v) }
}

extension PropertyKey {
    public static var gridRowStart: PropertyKey<GridRowStartValue> { "grid-row-start".propertyKey() }
}

public class GridRowStartValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init() {
        value = "auto"
    }
    
    public init (rowLine: Int) {
        value = "\(rowLine)"
    }
    
    public convenience init <V>(rowLine: V) where V: StateConvertible, V.Value == Int {
        let rowLine = rowLine.stateValue
        self.init(rowLine: rowLine.wrappedValue)
        rowLine.listen {
            self.value = "\($0)"
            self._changeHandler()
        }
    }
    
    public static var auto: GridRowStartValue { .init() }
    public static func rowLine(_ v: Int) -> GridRowStartValue { .init(rowLine: v) }
    public static func rowLine<V>(_ v: V) -> GridRowStartValue where V: StateConvertible, V.Value == Int { .init(rowLine: v) }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies where to start the grid item
    public typealias GridRowStart = GridRowStartProperty
}

extension CSSRulable {
    /// Specifies where to start the grid item
    public func gridRowStart() -> Self {
        s?._addProperty(GridRowStartProperty())
        return self
    }
    
    /// Specifies where to start the grid item
    public func gridRowStart(rowLine: Int) -> Self {
        s?._addProperty(GridRowStartProperty(rowLine: rowLine))
        return self
    }
    
    /// Specifies where to start the grid item
    public func gridRowStart<V>(rowLine: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(GridRowStartProperty(rowLine: rowLine))
        return self
    }
}
