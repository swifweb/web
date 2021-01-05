//
//  Float.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a box should float
///
/// ```html
/// float: right;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_float.asp)
public class FloatProperty: _Property {
    public var propertyKey: PropertyKey<FloatType> { .float }
    public var propertyValue: FloatType
    var _content = _PropertyContent<FloatType>()
    
    public init (_ type: FloatType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var float: PropertyKey<FloatType> { "float".propertyKey() }
}
