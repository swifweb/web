//
//  Hyphens.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets how to split words to improve the layout of paragraphs
///
/// ```html
/// div.a {
///     -webkit-hyphens: none;
///     -ms-hyphens: none;
///     hyphens: none;
/// }
///
/// div.b {
///     -webkit-hyphens: manual;
///     -ms-hyphens: manual;
///     hyphens: manual;
/// }
///
/// div.c {
///     -webkit-hyphens: auto;
///     -ms-hyphens: auto;
///     hyphens: auto;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_hyphens.asp)
public class HyphensProperty: _Property {
    public class Webkit: _Property {
        public var propertyKey: PropertyKey<HyphensType> { .hyphens_webKit }
        public var propertyValue: HyphensType
        var _content = _PropertyContent<HyphensType>()
        
        public init (_ type: HyphensType) {
            propertyValue = type
        }
    }
    
    public class MS: _Property {
        public var propertyKey: PropertyKey<HyphensType> { .hyphens_ms }
        public var propertyValue: HyphensType
        var _content = _PropertyContent<HyphensType>()
    
        public init (_ type: HyphensType) {
            propertyValue = type
        }
    }
    
    public var propertyKey: PropertyKey<HyphensType> { .hyphens }
    public var propertyValue: HyphensType
    public var propertyAliases: [AnyProperty]
    var _content = _PropertyContent<HyphensType>()
    
    public init (_ type: HyphensType) {
        propertyValue = type
        propertyAliases = [Webkit(type), MS(type)]
    }
}

extension PropertyKey {
    public static var hyphens: PropertyKey<HyphensType> { "hyphens".propertyKey() }
    public static var hyphens_webKit: PropertyKey<HyphensType> { "-webkit-hyphens".propertyKey() }
    public static var hyphens_ms: PropertyKey<HyphensType> { "-ms-hyphens".propertyKey() }
}
