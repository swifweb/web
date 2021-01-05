//
//  TextShadow.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Adds shadow to text
///
/// ```html
/// h1 {
///     text-shadow: 2px 2px #ff0000;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-shadow.asp)
public class TextShadowProperty: _Property {
    public var propertyKey: PropertyKey<[TextShadowType]> { .textShadows }
    public var propertyValue: [TextShadowType]
    var _content = _PropertyContent<[TextShadowType]>()
    
    public init (_ type: TextShadowType...) {
        propertyValue = type
    }
    
    public init (_ type: [TextShadowType]) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textShadows: PropertyKey<[TextShadowType]> { "text-shadow".propertyKey() }
    public static var textShadow: PropertyKey<TextShadowType> { "text-shadow".propertyKey() }
}

extension Array where Element == TextShadowType {
    public var description: String {
        map { $0.value }.joined(separator: ", ")
    }
}
