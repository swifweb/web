//
//  EmptyCells.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not to display borders and background on empty cells in a table
///
/// ```html
/// empty-cells: hide;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_tab_empty-cells.asp)
public class EmptyCellsProperty: _Property {
    public var propertyKey: PropertyKey<EmptyCellsType> { .emptyCells }
    public var propertyValue: EmptyCellsType
    var _content = _PropertyContent<EmptyCellsType>()
    
    public init (_ type: EmptyCellsType) {
        propertyValue = type
    }
    
        public convenience init (_ type: State<EmptyCellsType>) {
            self.init(type.wrappedValue)
            type.listen { self._changed(to: $0) }
        }
    
        public convenience init <V>(_ type: ExpressableState<V, EmptyCellsType>) {
            self.init(type.unwrap())
        }
}

extension PropertyKey {
    /// Specifies whether or not to display borders and background on empty cells in a table
    public static var emptyCells: PropertyKey<EmptyCellsType> { "empty-cells".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not to display borders and background on empty cells in a table
    public typealias EmptyCells = EmptyCellsProperty
}

extension CSSRulable {
    /// Specifies whether or not to display borders and background on empty cells in a table
    public func emptyCells(_ type: EmptyCellsType) -> Self {
        s?._addProperty(.emptyCells, type)
        return self
    }

    /// Specifies whether or not to display borders and background on empty cells in a table
    public func emptyCells(_ type: State<EmptyCellsType>) -> Self {
        s?._addProperty(EmptyCellsProperty(type))
        return self
    }

    /// Specifies whether or not to display borders and background on empty cells in a table
    public func emptyCells<V>(_ type: ExpressableState<V, EmptyCellsType>) -> Self {
        emptyCells(type.unwrap())
    }
}
