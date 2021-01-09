//
//  All.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Resets all properties (except unicode-bidi and direction)
///
/// ```html
/// all: initial;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_all.asp)
public class AllProperty: _Property {
    public var propertyKey: PropertyKey<AllType> { .all }
    public var propertyValue: AllType
    var _content = _PropertyContent<AllType>()
    
    public init (_ type: AllType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<AllType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, AllType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Resets all properties (except unicode-bidi and direction)
    public static var all: PropertyKey<AllType> { "all".propertyKey() }
}

extension Stylesheet {
    /// Resets all properties (except unicode-bidi and direction)
    public typealias All = AllProperty
}

extension CSSRulable {
    /// Resets all properties (except unicode-bidi and direction)
    public func all(_ type: AllType) -> Self {
        s?._addProperty(.all, type)
        return self
    }

    /// Resets all properties (except unicode-bidi and direction)
    public func all(_ type: State<AllType>) -> Self {
        s?._addProperty(AllProperty(type))
        return self
    }

    /// Resets all properties (except unicode-bidi and direction)
    public func all<V>(_ type: ExpressableState<V, AllType>) -> Self {
        all(type.unwrap())
    }
}
