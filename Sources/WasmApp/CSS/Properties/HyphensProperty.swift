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
    public var propertyKey: PropertyKey<HyphensType> { .hyphens }
    public var propertyValue: HyphensType
    public var propertyAliases: [AnyProperty]
    var _content = _PropertyContent<HyphensType>()
    
    public init (_ type: HyphensType) {
        propertyValue = type
        propertyAliases = [Webkit(type), MS(type)]
    }
    
    public convenience init (_ type: State<HyphensType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, HyphensType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets how to split words to improve the layout of paragraphs
    public static var hyphens: PropertyKey<HyphensType> { "hyphens".propertyKey() }
}

extension Stylesheet {
    /// Sets how to split words to improve the layout of paragraphs
    public typealias Hyphens = HyphensProperty
}

extension CSSRulable {
    /// Sets how to split words to improve the layout of paragraphs
    public func hyphens(_ type: HyphensType) -> Self {
        s?._addProperty(.hyphens, type)
        return self
    }

    /// Sets how to split words to improve the layout of paragraphs
    public func hyphens(_ type: State<HyphensType>) -> Self {
        s?._addProperty(HyphensProperty(type))
        return self
    }

    /// Sets how to split words to improve the layout of paragraphs
    public func hyphens<V>(_ type: ExpressableState<V, HyphensType>) -> Self {
        hyphens(type.unwrap())
    }
}

extension HyphensProperty {
    public class MS: _Property {
        public var propertyKey: PropertyKey<HyphensType> { .hyphens_ms }
        public var propertyValue: HyphensType
        var _content = _PropertyContent<HyphensType>()
    
        public init (_ type: HyphensType) {
            propertyValue = type
        }
        
        public convenience init (_ type: State<HyphensType>) {
            self.init(type.wrappedValue)
            type.listen { self._changed(to: $0) }
        }
    
        public convenience init <V>(_ type: ExpressableState<V, HyphensType>) {
            self.init(type.unwrap())
        }
    }
}

extension PropertyKey {
    public static var hyphens_ms: PropertyKey<HyphensType> { "-ms-hyphens".propertyKey() }
}

extension HyphensProperty {
    public class Webkit: _Property {
        public var propertyKey: PropertyKey<HyphensType> { .hyphens_webKit }
        public var propertyValue: HyphensType
        var _content = _PropertyContent<HyphensType>()
        
        public init (_ type: HyphensType) {
            propertyValue = type
        }
        
        public convenience init (_ type: State<HyphensType>) {
            self.init(type.wrappedValue)
            type.listen { self._changed(to: $0) }
        }
    
        public convenience init <V>(_ type: ExpressableState<V, HyphensType>) {
            self.init(type.unwrap())
        }
    }
}

extension PropertyKey {
    public static var hyphens_webKit: PropertyKey<HyphensType> { "-webkit-hyphens".propertyKey() }
}
