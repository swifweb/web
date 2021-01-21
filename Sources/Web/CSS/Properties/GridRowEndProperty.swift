//
//  GridRowEndProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public init (span n: Int) {
        propertyValue = .span(n)
    }
    
    public init <V>(span n: V) where V: StateConvertible, V.Value == Int {
        propertyValue = .span(n)
    }
    
    public static var auto: GridRowEndValue { .init() }
    public static func rowLine(_ v: Int) -> GridRowEndValue { .init(rowLine: v) }
    public static func rowLine<V>(_ v: V) -> GridRowEndValue where V: StateConvertible, V.Value == Int { .init(rowLine: v) }
    public static func span(_ n: Int) -> GridRowEndValue { .init(span: n) }
    public static func span<V>(_ n: V) -> GridRowEndValue where V: StateConvertible, V.Value == Int { .init(span: n) }
}

extension PropertyKey {
    /// Specifies where to end the grid item
    public static var gridRowEnd: PropertyKey<GridRowEndValue> { "grid-row-end".propertyKey() }
}

public class GridRowEndValue: CustomStringConvertible, _PropertyValueInnerChangeable {
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
    
    public init (span n: Int) {
        value = "span \(n)"
    }
    
    public convenience init <V>(span n: V) where V: StateConvertible, V.Value == Int {
        let n = n.stateValue
        self.init(span: n.wrappedValue)
        n.listen {
            self.value = "span \($0)"
            self._changeHandler()
        }
    }
    
    public static var auto: GridRowEndValue { .init() }
    public static func rowLine(_ v: Int) -> GridRowEndValue { .init(rowLine: v) }
    public static func rowLine<V>(_ v: V) -> GridRowEndValue where V: StateConvertible, V.Value == Int { .init(rowLine: v) }
    public static func span(_ n: Int) -> GridRowEndValue { .init(span: n) }
    public static func span<V>(_ n: V) -> GridRowEndValue where V: StateConvertible, V.Value == Int { .init(span: n) }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies where to end the grid item
    public typealias GridRowEnd = GridRowEndProperty
}

extension CSSRulable {
    /// Specifies where to end the grid item
    public func gridRowEnd() -> Self {
        s?._addProperty(GridRowEndProperty())
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridRowEnd(rowLine: Int) -> Self {
        s?._addProperty(GridRowEndProperty(rowLine: rowLine))
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridRowEnd<V>(rowLine: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(GridRowEndProperty(rowLine: rowLine))
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridRowEnd(span n: Int) -> Self {
        s?._addProperty(GridRowEndProperty(span: n))
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridRowEnd<V>(span n: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(GridRowEndProperty(span: n))
        return self
    }
}
