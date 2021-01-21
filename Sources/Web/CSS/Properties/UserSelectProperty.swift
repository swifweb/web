//
//  UserSelect.swift
//  Web
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
    public var propertyKey: PropertyKey<UserSelectType> { .userSelect }
    public var propertyValue: UserSelectType
    public var propertyAliases: [AnyProperty]
    var _content = _PropertyContent<UserSelectType>()
    
    public init (_ type: UserSelectType) {
        propertyValue = type
        propertyAliases = [Webkit(type), MS(type)]
    }
    
    public convenience init (_ type: State<UserSelectType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, UserSelectType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether the text of an element can be selected
    public static var userSelect: PropertyKey<UserSelectType> { "user-select".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether the text of an element can be selected
    public typealias UserSelect = UserSelectProperty
}

extension CSSRulable {
    /// Specifies whether the text of an element can be selected
    public func userSelect(_ type: UserSelectType) -> Self {
        s?._addProperty(.userSelect, type)
        return self
    }

    /// Specifies whether the text of an element can be selected
    public func userSelect(_ type: State<UserSelectType>) -> Self {
        s?._addProperty(UserSelectProperty(type))
        return self
    }

    /// Specifies whether the text of an element can be selected
    public func userSelect<V>(_ type: ExpressableState<V, UserSelectType>) -> Self {
        userSelect(type.unwrap())
    }
}

extension UserSelectProperty {
    public class MS: _Property {
        public var propertyKey: PropertyKey<UserSelectType> { .userSelect_ms }
        public var propertyValue: UserSelectType
        var _content = _PropertyContent<UserSelectType>()
    
        public init (_ type: UserSelectType) {
            propertyValue = type
        }
        
        public convenience init (_ type: State<UserSelectType>) {
            self.init(type.wrappedValue)
            type.listen { self._changed(to: $0) }
        }
    
        public convenience init <V>(_ type: ExpressableState<V, UserSelectType>) {
            self.init(type.unwrap())
        }
    }
}

extension PropertyKey {
    public static var userSelect_ms: PropertyKey<UserSelectType> { "-ms-user-select".propertyKey() }
}

extension UserSelectProperty {
    public class Webkit: _Property {
        public var propertyKey: PropertyKey<UserSelectType> { .userSelect_webKit }
        public var propertyValue: UserSelectType
        var _content = _PropertyContent<UserSelectType>()
        
        public init (_ type: UserSelectType) {
            propertyValue = type
        }
        
        public convenience init (_ type: State<UserSelectType>) {
            self.init(type.wrappedValue)
            type.listen { self._changed(to: $0) }
        }
    
        public convenience init <V>(_ type: ExpressableState<V, UserSelectType>) {
            self.init(type.unwrap())
        }
    }
}

extension PropertyKey {
    public static var userSelect_webKit: PropertyKey<UserSelectType> { "-webkit-user-select".propertyKey() }
}
