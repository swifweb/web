//
//  MixBlendMode.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies how an element's content should blend with its direct parent background
///
/// ```html
/// .container {
///     background-color: red;
/// }
///
/// .container img {
///     mix-blend-mode: darken;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_mix-blend-mode.asp)
public class MixBlendModeProperty: _Property {
    public var propertyKey: PropertyKey<MixBlendModeType> { .mixBlendMode }
    public var propertyValue: MixBlendModeType
    var _content = _PropertyContent<MixBlendModeType>()
    
    public init (_ type: MixBlendModeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var mixBlendMode: PropertyKey<MixBlendModeType> { "mix-blend-mode".propertyKey() }
}
