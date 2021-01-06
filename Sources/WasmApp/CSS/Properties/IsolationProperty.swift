//
//  Isolation.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Defines whether an element must create a new stacking content
///
/// ```html
/// isolation: isolate;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_isolation.asp)
public class IsolationProperty: _Property {
    public var propertyKey: PropertyKey<IsolationType> { .isolation }
    public var propertyValue: IsolationType
    var _content = _PropertyContent<IsolationType>()
    
    public init (_ type: IsolationType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<IsolationType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, IsolationType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines whether an element must create a new stacking content
    public static var isolation: PropertyKey<IsolationType> { "isolation".propertyKey() }
}

extension Stylesheet {
    /// Defines whether an element must create a new stacking content
    public typealias Isolation = IsolationProperty
}

extension CSSRulable {
    /// Defines whether an element must create a new stacking content
    public func isolation(_ type: IsolationType) -> Self {
        s?._addProperty(.isolation, type)
        return self
    }

    /// Defines whether an element must create a new stacking content
    public func isolation(_ type: State<IsolationType>) -> Self {
        s?._addProperty(IsolationProperty(type))
        return self
    }

    /// Defines whether an element must create a new stacking content
    public func isolation<V>(_ type: ExpressableState<V, IsolationType>) -> Self {
        isolation(type.unwrap())
    }
}
