//
//  Overflow.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies what happens if content overflows an element's box
///
/// ```html
/// overflow: scroll;
/// overflow: hidden;
/// overflow: auto;
/// overflow: visible;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow)
public class OverflowProperty: _Property {
    public var propertyKey: PropertyKey<OverflowType> { .overflow }
    public var propertyValue: OverflowType
    var _content = _PropertyContent<OverflowType>()
    
    public init (_ type: OverflowType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<OverflowType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, OverflowType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies what happens if content overflows an element's box
    public static var overflow: PropertyKey<OverflowType> { "overflow".propertyKey() }
}

extension Stylesheet {
    /// Specifies what happens if content overflows an element's box
    public typealias Overflow = OverflowProperty
}

extension CSSRulable {
    /// Specifies what happens if content overflows an element's box
    public func overflow(_ type: OverflowType) -> Self {
        s?._addProperty(.overflow, type)
        return self
    }

    /// Specifies what happens if content overflows an element's box
    public func overflow(_ type: State<OverflowType>) -> Self {
        s?._addProperty(OverflowProperty(type))
        return self
    }

    /// Specifies what happens if content overflows an element's box
    public func overflow<V>(_ type: ExpressableState<V, OverflowType>) -> Self {
        overflow(type.unwrap())
    }
}
