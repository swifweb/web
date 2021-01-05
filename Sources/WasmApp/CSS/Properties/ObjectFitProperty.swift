//
//  ObjectFit.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies how the contents of a replaced element should be fitted to the box established by its used height and width
///
/// ```html
/// object-fit: cover;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_object-fit.asp)
public class ObjectFitProperty: _Property {
    public var propertyKey: PropertyKey<ObjectFitType> { .objectFit }
    public var propertyValue: ObjectFitType
    var _content = _PropertyContent<ObjectFitType>()
    
    public init (_ type: ObjectFitType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var objectFit: PropertyKey<ObjectFitType> { "object-fit".propertyKey() }
}
