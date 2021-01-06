//
//  BoxDecorationBreak.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Sets the behavior of the background and border of an element at page-break, or, for in-line elements, at line-break.
///
/// ```html
/// box-decoration-break: clone;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_box-decoration-break.asp)
public class BoxDecorationBreakProperty: _Property {
    public var propertyKey: PropertyKey<BoxDecorationBreakType> { .boxDecorationBreak }
    public var propertyValue: BoxDecorationBreakType
    public var propertyAliases: [AnyProperty]
    var _content = _PropertyContent<BoxDecorationBreakType>()
    
    public init (_ type: BoxDecorationBreakType) {
        propertyValue = type
        propertyAliases = [Webkit(type), O(type)]
    }
    
    public convenience init (_ type: State<BoxDecorationBreakType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BoxDecorationBreakType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the behavior of the background and border of an element at page-break, or, for in-line elements, at line-break.
    public static var boxDecorationBreak: PropertyKey<BoxDecorationBreakType> { "box-decoration-break".propertyKey() }
}

extension Stylesheet {
    /// Sets the behavior of the background and border of an element at page-break, or, for in-line elements, at line-break.
    public typealias BoxDecorationBreak = BoxDecorationBreakProperty
}

extension CSSRulable {
    /// Sets the behavior of the background and border of an element at page-break, or, for in-line elements, at line-break.
    public func boxDecorationBreak(_ type: BoxDecorationBreakType) -> Self {
        s?._addProperty(.boxDecorationBreak, type)
        return self
    }

    /// Sets the behavior of the background and border of an element at page-break, or, for in-line elements, at line-break.
    public func boxDecorationBreak(_ type: State<BoxDecorationBreakType>) -> Self {
        s?._addProperty(BoxDecorationBreakProperty(type))
        return self
    }

    /// Sets the behavior of the background and border of an element at page-break, or, for in-line elements, at line-break.
    public func boxDecorationBreak<V>(_ type: ExpressableState<V, BoxDecorationBreakType>) -> Self {
        boxDecorationBreak(type.unwrap())
    }
}

// MARK: Opera prefix

extension BoxDecorationBreakProperty {
    public class O: _Property {
        public var propertyKey: PropertyKey<BoxDecorationBreakType> { .boxDecorationBreak_o }
        public var propertyValue: BoxDecorationBreakType
        var _content = _PropertyContent<BoxDecorationBreakType>()
    
        public init (_ type: BoxDecorationBreakType) {
            propertyValue = type
        }
        
        public convenience init (_ type: State<BoxDecorationBreakType>) {
            self.init(type.wrappedValue)
            type.listen { self._changed(to: $0) }
        }
    
        public convenience init <V>(_ type: ExpressableState<V, BoxDecorationBreakType>) {
            self.init(type.unwrap())
        }
    }
}

extension PropertyKey {
    public static var boxDecorationBreak_o: PropertyKey<BoxDecorationBreakType> { "-o-box-decoration-break".propertyKey() }
}

// MARK: Webkit prefix

extension BoxDecorationBreakProperty {
    public class Webkit: _Property {
        public var propertyKey: PropertyKey<BoxDecorationBreakType> { .boxDecorationBreak_webKit }
        public var propertyValue: BoxDecorationBreakType
        var _content = _PropertyContent<BoxDecorationBreakType>()
        
        public init (_ type: BoxDecorationBreakType) {
            propertyValue = type
        }
        
        public convenience init (_ type: State<BoxDecorationBreakType>) {
            self.init(type.wrappedValue)
            type.listen { self._changed(to: $0) }
        }
    
        public convenience init <V>(_ type: ExpressableState<V, BoxDecorationBreakType>) {
            self.init(type.unwrap())
        }
    }
}

extension PropertyKey {
    public static var boxDecorationBreak_webKit: PropertyKey<BoxDecorationBreakType> { "-webkit-box-decoration-break".propertyKey() }
}
