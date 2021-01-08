//
//  GridGapProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the grid-row-gap and grid-column-gap properties
///
/// ```html
/// grid-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-gap.asp)
public class GridGapProperty: _Property {
    public var propertyKey: PropertyKey<GridGapValue> { .gridGap }
    public var propertyValue: GridGapValue
    var _content = _PropertyContent<GridGapValue>()
    
    public init<R: UnitValuable>(_ rowGap: R) {
        propertyValue = .init(rowGap)
    }
    
    public init<R>(_ rowGap: R) where R: StateConvertible, R.Value: UnitValuable {
        propertyValue = .init(rowGap)
    }
    
    public init<R: UnitValuable, C: UnitValuable>(_ rowGap: R, _ columnGap: C) {
        propertyValue = .init(rowGap, columnGap)
    }
    
    public init<R, C: UnitValuable>(_ rowGap: R, _ columnGap: C) where R: StateConvertible, R.Value: UnitValuable {
        propertyValue = .init(rowGap, columnGap)
    }
    
    public init<R: UnitValuable, C>(_ rowGap: R, _ columnGap: C) where C: StateConvertible, C.Value: UnitValuable {
        propertyValue = .init(rowGap, columnGap)
    }
    
    public init<R, C>(_ rowGap: R, _ columnGap: C) where R: StateConvertible, R.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        propertyValue = .init(rowGap, columnGap)
    }
}

extension PropertyKey {
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public static var gridGap: PropertyKey<GridGapValue> { "grid-gap".propertyKey() }
}

public class GridGapValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init<R: UnitValuable>(_ rowGap: R) {
        value = rowGap.description
    }
    
    public convenience init<R>(_ rowGap: R) where R: StateConvertible, R.Value: UnitValuable {
        let rowGap = rowGap.stateValue
        self.init(rowGap.wrappedValue)
        rowGap.listen {
            self.value = $0.description
            self._changeHandler()
        }
    }
    
    public init<R: UnitValuable, C: UnitValuable>(_ rowGap: R, _ columnGap: C) {
        value = [rowGap.description, columnGap.description].joined(separator: " ")
    }
    
    public convenience init<R, C: UnitValuable>(_ rowGap: R, _ columnGap: C) where R: StateConvertible, R.Value: UnitValuable {
        let rowGap = rowGap.stateValue
        self.init(rowGap.wrappedValue, columnGap)
        rowGap.listen {
            self.value = [$0.description, columnGap.description].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init<R: UnitValuable, C>(_ rowGap: R, _ columnGap: C) where C: StateConvertible, C.Value: UnitValuable {
        let columnGap = columnGap.stateValue
        self.init(rowGap, columnGap.wrappedValue)
        columnGap.listen {
            self.value = [rowGap.description, $0.description].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init<R, C>(_ rowGap: R, _ columnGap: C) where R: StateConvertible, R.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        let rowGap = rowGap.stateValue
        let columnGap = columnGap.stateValue
        self.init(rowGap.wrappedValue, columnGap.wrappedValue)
        rowGap.listen {
            self.value = [$0.description, columnGap.wrappedValue.description].joined(separator: " ")
            self._changeHandler()
        }
        columnGap.listen {
            self.value = [rowGap.wrappedValue.description, $0.description].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public typealias GridGap = GridGapProperty
}

extension CSSRulable {
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public func gridGap<R: UnitValuable>(_ rowGap: R) -> Self {
        s?._addProperty(GridGapProperty(rowGap))
        return self
    }
    
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public func gridGap<R>(_ rowGap: R) -> Self where R: StateConvertible, R.Value: UnitValuable {
        s?._addProperty(GridGapProperty(rowGap))
        return self
    }
    
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public func gridGap<R: UnitValuable, C: UnitValuable>(_ rowGap: R, _ columnGap: C) -> Self {
        s?._addProperty(GridGapProperty(rowGap, columnGap))
        return self
    }
    
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public func gridGap<R, C: UnitValuable>(_ rowGap: R, _ columnGap: C) -> Self where R: StateConvertible, R.Value: UnitValuable {
        s?._addProperty(GridGapProperty(rowGap, columnGap))
        return self
    }
    
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public func gridGap<R: UnitValuable, C>(_ rowGap: R, _ columnGap: C) -> Self where C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(GridGapProperty(rowGap, columnGap))
        return self
    }
    
    /// A shorthand property for the grid-row-gap and grid-column-gap properties
    public func gridGap<R, C>(_ rowGap: R, _ columnGap: C) -> Self where R: StateConvertible, R.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(GridGapProperty(rowGap, columnGap))
        return self
    }
}
