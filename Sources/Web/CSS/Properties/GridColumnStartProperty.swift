//
//  GridColumnStartProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies where to start the grid item
///
/// ```html
/// grid-column-start: 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-start.asp)
public class GridColumnStartProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnStartValue> { .gridColumnStart }
    public var propertyValue: GridColumnStartValue
    var _content = _PropertyContent<GridColumnStartValue>()
    
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
    
    public static var auto: GridColumnStartValue { .init() }
    public static func columnLine(_ v: Int) -> GridColumnStartValue { .init(columnLine: v) }
    public static func columnLine<V>(_ v: V) -> GridColumnStartValue where V: StateConvertible, V.Value == Int { .init(columnLine: v) }
    public static func span(_ n: Int) -> GridColumnStartValue { .init(span: n) }
    public static func span<V>(_ n: V) -> GridColumnStartValue where V: StateConvertible, V.Value == Int { .init(span: n) }
}

extension PropertyKey {
    /// Specifies where to start the grid item
    public static var gridColumnStart: PropertyKey<GridColumnStartValue> { "grid-column-start".propertyKey() }
}

public class GridColumnStartValue: CustomStringConvertible, _PropertyValueInnerChangeable {
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
    
    public static var auto: GridColumnStartValue { .init() }
    public static func columnLine(_ v: Int) -> GridColumnStartValue { .init(columnLine: v) }
    public static func columnLine<V>(_ v: V) -> GridColumnStartValue where V: StateConvertible, V.Value == Int { .init(columnLine: v) }
    public static func span(_ n: Int) -> GridColumnStartValue { .init(span: n) }
    public static func span<V>(_ n: V) -> GridColumnStartValue where V: StateConvertible, V.Value == Int { .init(span: n) }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies where to start the grid item
    public typealias GridColumnStart = GridColumnStartProperty
}

extension CSSRulable {
    /// Specifies where to start the grid item
    public func gridColumnStart() -> Self {
        s?._addProperty(GridColumnStartProperty())
        return self
    }
    
    /// Specifies where to start the grid item
    public func gridColumnStart(columnLine: Int) -> Self {
        s?._addProperty(GridColumnStartProperty(columnLine: columnLine))
        return self
    }
    
    /// Specifies where to start the grid item
    public func gridColumnStart<V>(columnLine: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(GridColumnStartProperty(columnLine: columnLine))
        return self
    }
    
    /// Specifies where to start the grid item
    public func gridColumnStart(span n: Int) -> Self {
        s?._addProperty(GridColumnStartProperty(span: n))
        return self
    }
    
    /// Specifies where to start the grid item
    public func gridColumnStart<V>(span n: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(GridColumnStartProperty(span: n))
        return self
    }
}
