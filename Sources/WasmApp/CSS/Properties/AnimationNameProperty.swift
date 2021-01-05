//
//  AnimationName.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies a name for the @keyframes animation
///
/// ```html
/// animation-name: mymove;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-name.asp)
public class AnimationNameProperty: _Property {
    public var propertyKey: PropertyKey<String> { .animationName }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ name: String) {
        propertyValue = name
    }
}

extension PropertyKey {
    public static var animationName: PropertyKey<String> { "animation-name".propertyKey() }
}
