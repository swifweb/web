//
//  GridColumnProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the grid-column-start and the grid-column-end properties
///
/// ```html
/// grid-column: 1 / span 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column.asp)
public class GridColumnProperty: _Property {
    public var propertyKey: PropertyKey<GridColumnValue> { .gridColumn }
    public var propertyValue: GridColumnValue
    var _content = _PropertyContent<GridColumnValue>()
    
    public init (start: Int, end: Int) {
        propertyValue = GridColumnValue(start: start, end: end)
    }
    
    public init <S>(start: S, end: Int) where S: StateConvertible, S.Value == Int {
        propertyValue = GridColumnValue(start: start, end: end)
    }
    
    public init <E>(start: Int, end: E) where E: StateConvertible, E.Value == Int {
        propertyValue = GridColumnValue(start: start, end: end)
    }
    
    public init <S, E>(start: S, end: E) where S: StateConvertible, S.Value == Int, E: StateConvertible, E.Value == Int {
        propertyValue = GridColumnValue(start: start, end: end)
    }
}

extension PropertyKey {
    /// A shorthand property for the grid-column-start and the grid-column-end properties
    public static var gridColumn: PropertyKey<GridColumnValue> { "grid-column".propertyKey() }
}

public class GridColumnValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (start: Int, end: Int) {
        value = "\(start) / \(end)"
    }
    
    public convenience init <S>(start: S, end: Int) where S: StateConvertible, S.Value == Int {
        let start = start.stateValue
        self.init(start: start.wrappedValue, end: end)
        start.listen {
            self.value = "\($0) / \(end)"
            self._changeHandler()
        }
    }
    
    public convenience init <E>(start: Int, end: E) where E: StateConvertible, E.Value == Int {
        let end = end.stateValue
        self.init(start: start, end: end.wrappedValue)
        end.listen {
            self.value = "\(start) / \($0)"
            self._changeHandler()
        }
    }
    
    public convenience init <S, E>(start: S, end: E) where S: StateConvertible, S.Value == Int, E: StateConvertible, E.Value == Int {
        let start = start.stateValue
        let end = end.stateValue
        self.init(start: start.wrappedValue, end: end.wrappedValue)
        start.listen {
            self.value = "\($0) / \(end)"
            self._changeHandler()
        }
        end.listen {
            self.value = "\(start) / \($0)"
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for the grid-column-start and the grid-column-end properties
    public typealias GridColumn = GridColumnProperty
}

extension CSSRulable {
    /// A shorthand property for the grid-column-start and the grid-column-end properties
    public func gridColumn(start: Int, end: Int) -> Self {
        s?._addProperty(GridColumnProperty(start: start, end: end))
        return self
    }

    /// A shorthand property for the grid-column-start and the grid-column-end properties
    public func gridColumn<S>(start: S, end: Int) -> Self where S: StateConvertible, S.Value == Int {
        s?._addProperty(GridColumnProperty(start: start, end: end))
        return self
    }

    /// A shorthand property for the grid-column-start and the grid-column-end properties
    public func gridColumn<E>(start: Int, end: E) -> Self where E: StateConvertible, E.Value == Int {
        s?._addProperty(GridColumnProperty(start: start, end: end))
        return self
    }

    /// A shorthand property for the grid-column-start and the grid-column-end properties
    public func gridColumn<S, E>(start: S, end: E) -> Self where S: StateConvertible, S.Value == Int, E: StateConvertible, E.Value == Int {
        s?._addProperty(GridColumnProperty(start: start, end: end))
        return self
    }
}
