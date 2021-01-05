//
//  UserSelect.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies whether the text of an element can be selected
///
/// ```html
/// div {
///     -webkit-user-select: none; /* Safari */
///     -ms-user-select: none; /* IE 10+ and Edge */
///     user-select: none; /* Standard syntax */
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_user-select.asp)
public class UserSelectProperty: _Property {
    public class Webkit: _Property {
        public var propertyKey: PropertyKey<UserSelectType> { .userSelect_webKit }
        public var propertyValue: UserSelectType
        var _content = _PropertyContent<UserSelectType>()
        
        public init (_ type: UserSelectType) {
            propertyValue = type
        }
    }
    
    public class MS: _Property {
        public var propertyKey: PropertyKey<UserSelectType> { .userSelect_ms }
        public var propertyValue: UserSelectType
        var _content = _PropertyContent<UserSelectType>()
    
        public init (_ type: UserSelectType) {
            propertyValue = type
        }
    }
    
    public var propertyKey: PropertyKey<UserSelectType> { .userSelect }
    public var propertyValue: UserSelectType
    public var propertyAliases: [AnyProperty]
    var _content = _PropertyContent<UserSelectType>()
    
    public init (_ type: UserSelectType) {
        propertyValue = type
        propertyAliases = [Webkit(type), MS(type)]
    }
}

extension PropertyKey {
    public static var userSelect: PropertyKey<UserSelectType> { "user-select".propertyKey() }
    public static var userSelect_webKit: PropertyKey<UserSelectType> { "-webkit-user-select".propertyKey() }
    public static var userSelect_ms: PropertyKey<UserSelectType> { "-ms-user-select".propertyKey() }
}
