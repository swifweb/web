//
//  GridRowProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the grid-row-start and the grid-row-end properties
///
/// ```html
/// grid-row: 1 / span 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row.asp)
public class GridRowProperty: _Property {
    public var propertyKey: PropertyKey<GridRowValue> { .gridRow }
    public var propertyValue: GridRowValue
    var _content = _PropertyContent<GridRowValue>()
    
    public init (start: Int, end: Int) {
        propertyValue = GridRowValue(start: start, end: end)
    }
    
    public init <S>(start: S, end: Int) where S: StateConvertible, S.Value == Int {
        propertyValue = GridRowValue(start: start, end: end)
    }
    
    public init <E>(start: Int, end: E) where E: StateConvertible, E.Value == Int {
        propertyValue = GridRowValue(start: start, end: end)
    }
    
    public init <S, E>(start: S, end: E) where S: StateConvertible, S.Value == Int, E: StateConvertible, E.Value == Int {
        propertyValue = GridRowValue(start: start, end: end)
    }
}

extension PropertyKey {
    /// A shorthand property for the grid-row-start and the grid-row-end properties
    public static var gridRow: PropertyKey<GridRowValue> { "grid-row".propertyKey() }
}

public class GridRowValue: CustomStringConvertible, _PropertyValueInnerChangeable {
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
    /// A shorthand property for the grid-row-start and the grid-row-end properties
    public typealias GridRow = GridRowProperty
}

extension CSSRulable {
    /// A shorthand property for the grid-row-start and the grid-row-end properties
    public func gridRow(start: Int, end: Int) -> Self {
        s?._addProperty(GridRowProperty(start: start, end: end))
        return self
    }

    /// A shorthand property for the grid-row-start and the grid-row-end properties
    public func gridRow<S>(start: S, end: Int) -> Self where S: StateConvertible, S.Value == Int {
        s?._addProperty(GridRowProperty(start: start, end: end))
        return self
    }

    /// A shorthand property for the grid-row-start and the grid-row-end properties
    public func gridRow<E>(start: Int, end: E) -> Self where E: StateConvertible, E.Value == Int {
        s?._addProperty(GridRowProperty(start: start, end: end))
        return self
    }

    /// A shorthand property for the grid-row-start and the grid-row-end properties
    public func gridRow<S, E>(start: S, end: E) -> Self where S: StateConvertible, S.Value == Int, E: StateConvertible, E.Value == Int {
        s?._addProperty(GridRowProperty(start: start, end: end))
        return self
    }
}
