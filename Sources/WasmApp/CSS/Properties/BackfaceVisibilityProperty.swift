//
//  BackfaceVisibility.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Defines whether or not the back face of an element should be visible when facing the user
///
/// ```html
/// backface-visibility: hidden;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_backface-visibility.asp)
public class BackfaceVisibilityProperty: _Property {
    public var propertyKey: PropertyKey<BackfaceVisibilityType> { .backfaceVisibility }
    public var propertyValue: BackfaceVisibilityType
    var _content = _PropertyContent<BackfaceVisibilityType>()
    
    public init (_ type: BackfaceVisibilityType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backfaceVisibility: PropertyKey<BackfaceVisibilityType> { "backface-visibility".propertyKey() }
}
