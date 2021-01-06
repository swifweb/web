//
//  FlexDirectionProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the direction of the flexible items
///
/// ```html
/// flex-direction: row-reverse;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-direction.asp)
public class FlexDirectionProperty: _Property {
    public var propertyKey: PropertyKey<FlexDirectionType> { .flexDirection }
    public var propertyValue: FlexDirectionType
    var _content = _PropertyContent<FlexDirectionType>()
    
    public init (_ type: FlexDirectionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var flexDirection: PropertyKey<FlexDirectionType> { "flex-direction".propertyKey() }
}
