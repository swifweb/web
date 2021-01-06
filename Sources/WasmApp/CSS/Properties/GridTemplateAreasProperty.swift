//
//  GridTemplateAreasProperty.swift
//  WasmApp
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
    public var propertyKey: PropertyKey<String> { .gridTemplateAreas }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ area: String...) {
        propertyValue = "\"\(area.joined(separator: " "))\""
    }
    
    public init (_ area: [String]) {
        propertyValue = "\"\(area.joined(separator: " "))\""
    }
}

extension PropertyKey {
    public static var gridTemplateAreas: PropertyKey<String> { "grid-template-areas".propertyKey() }
}
