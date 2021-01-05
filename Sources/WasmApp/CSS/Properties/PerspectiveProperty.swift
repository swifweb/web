//
//  Perspective.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Gives a 3D-positioned element some perspective
///
/// ```html
/// perspective: 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_perspective.asp)
public class PerspectiveProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .perspective }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<L: UnitValuable>(_ v: L) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var perspective: PropertyKey<UnitValue> { "perspective".propertyKey() }
}
