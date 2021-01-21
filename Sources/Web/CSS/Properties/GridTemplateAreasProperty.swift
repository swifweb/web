//
//  GridTemplateAreasProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies how to display columns and rows, using named grid items
///
/// ```html
/// .item1 {
///     grid-area: myArea;
/// }
/// .grid-container {
///     display: grid;
///     grid-template-areas: "myArea myArea . . .";
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-template-areas.asp)
public class GridTemplateAreasProperty: _Property {
    public var propertyKey: PropertyKey<GridTemplateAreasValue> { .gridTemplateAreas }
    public var propertyValue: GridTemplateAreasValue
    var _content = _PropertyContent<GridTemplateAreasValue>()
    
    public init (_ areas: [String]) {
        propertyValue = .init(areas)
    }
    
    public convenience init (_ areas: String...) {
        self.init(areas)
    }
    
    public convenience init <V>(_ areas: V) where V: StateConvertible, V.Value == [String] {
        let areas = areas.stateValue
        self.init(areas.wrappedValue)
        areas.listen { self._changed(to: .init($0)) }
    }
}

extension PropertyKey {
    public static var gridTemplateAreas: PropertyKey<GridTemplateAreasValue> { "grid-template-areas".propertyKey() }
}

public class GridTemplateAreasValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    public init (_ area: [String]) {
        value = "\"\(area.joined(separator: " "))\""
        $value.listen { self._changeHandler() }
    }
    
    public convenience init (_ areas: String...) {
        self.init(areas)
    }
    
    public convenience init <V>(_ area: V) where V: StateConvertible, V.Value == [String] {
        let area = area.stateValue
        self.init(area.wrappedValue)
        area.listen {
            self.value = "\"\($0.joined(separator: " "))\""
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies how to display columns and rows, using named grid items
    public typealias GridTemplateAreas = GridTemplateAreasProperty
}

extension CSSRulable {
    /// Specifies how to display columns and rows, using named grid items
    public func gridTemplateAreas(_ type: String...) -> Self {
        gridTemplateAreas(type)
    }

    /// Specifies how to display columns and rows, using named grid items
    public func gridTemplateAreas(_ type: [String]) -> Self {
        s?._addProperty(GridTemplateAreasProperty(type))
        return self
    }

    /// Specifies how to display columns and rows, using named grid items
    public func gridTemplateAreas<V>(_ type: V) -> Self where V: StateConvertible, V.Value == [String] {
        s?._addProperty(GridTemplateAreasProperty(type))
        return self
    }
}
