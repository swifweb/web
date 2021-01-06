//
//  BorderCollapseProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets whether table borders should collapse into a single border or be separated
///
/// ```html
/// border-collapse: separate;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-collapse.asp)
public class BorderCollapseProperty: _Property {
    public var propertyKey: PropertyKey<BorderCollapseType> { .borderCollapse }
    public var propertyValue: BorderCollapseType
    var _content = _PropertyContent<BorderCollapseType>()
    
    public init (_ type: BorderCollapseType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderCollapse: PropertyKey<BorderCollapseType> { "border-collapse".propertyKey() }
}
