//
//  GridColumnEndProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies where to end the grid item
///
/// ```html
/// grid-column-end: span 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-end.asp)
public class GridColumnEndProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnEndValue> { .gridColumnEnd }
    public var propertyValue: GridColumnEndValue
    var _content = _PropertyContent<GridColumnEndValue>()
    
    // Means `auto`
    public init() {
        propertyValue = .auto
    }
    
    public init (columnLine: Int) {
        propertyValue = .columnLine(columnLine)
    }
    
    public init <V>(columnLine: V) where V: StateConvertible, V.Value == Int {
        propertyValue = .columnLine(columnLine)
    }
    
    public init (span n: Int) {
        propertyValue = .span(n)
    }
    
    public init <V>(span n: V) where V: StateConvertible, V.Value == Int {
        propertyValue = .span(n)
    }
    
    public static var auto: GridColumnEndValue { .init() }
    public static func columnLine(_ v: Int) -> GridColumnEndValue { .init(columnLine: v) }
    public static func columnLine<V>(_ v: V) -> GridColumnEndValue where V: StateConvertible, V.Value == Int { .init(columnLine: v) }
    public static func span(_ n: Int) -> GridColumnEndValue { .init(span: n) }
    public static func span<V>(_ n: V) -> GridColumnEndValue where V: StateConvertible, V.Value == Int { .init(span: n) }
}

extension PropertyKey {
    /// Specifies where to end the grid item
    public static var gridColumnEnd: PropertyKey<GridColumnEndValue> { "grid-column-end".propertyKey() }
}

public class GridColumnEndValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init() {
        value = "auto"
    }
    
    public init (columnLine: Int) {
        value = "\(columnLine)"
    }
    
    public convenience init <V>(columnLine: V) where V: StateConvertible, V.Value == Int {
        let columnLine = columnLine.stateValue
        self.init(columnLine: columnLine.wrappedValue)
        columnLine.listen {
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
    
    public static var auto: GridColumnEndValue { .init() }
    public static func columnLine(_ v: Int) -> GridColumnEndValue { .init(columnLine: v) }
    public static func columnLine<V>(_ v: V) -> GridColumnEndValue where V: StateConvertible, V.Value == Int { .init(columnLine: v) }
    public static func span(_ n: Int) -> GridColumnEndValue { .init(span: n) }
    public static func span<V>(_ n: V) -> GridColumnEndValue where V: StateConvertible, V.Value == Int { .init(span: n) }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies where to end the grid item
    public typealias GridColumnEnd = GridColumnEndProperty
}

extension CSSRulable {
    /// Specifies where to end the grid item
    public func gridColumnEnd() -> Self {
        s?._addProperty(GridColumnEndProperty())
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridColumnEnd(columnLine: Int) -> Self {
        s?._addProperty(GridColumnEndProperty(columnLine: columnLine))
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridColumnEnd<V>(columnLine: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(GridColumnEndProperty(columnLine: columnLine))
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridColumnEnd(span n: Int) -> Self {
        s?._addProperty(GridColumnEndProperty(span: n))
        return self
    }
    
    /// Specifies where to end the grid item
    public func gridColumnEnd<V>(span n: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(GridColumnEndProperty(span: n))
        return self
    }
}
