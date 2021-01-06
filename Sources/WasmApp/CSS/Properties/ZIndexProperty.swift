//
//  ZIndex.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the stack order of a positioned element
///
/// ```html
/// img {
///     position: absolute;
///     left: 0px;
///     top: 0px;
///     z-index: -1;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_z-index.asp)
public class ZIndexProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .zIndex }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ value: Int) {
        propertyValue = value
    }
    
    public convenience init (_ type: State<Int>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, Int>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the stack order of a positioned element
    public static var zIndex: PropertyKey<Int> { "z-index".propertyKey() }
}

extension Stylesheet {
    /// Sets the stack order of a positioned element
    public typealias ZIndex = ZIndexProperty
}

extension CSSRulable {
    /// Sets the stack order of a positioned element
    public func zIndex(_ type: Int) -> Self {
        s?._addProperty(.zIndex, type)
        return self
    }

    /// Sets the stack order of a positioned element
    public func zIndex(_ type: State<Int>) -> Self {
        s?._addProperty(ZIndexProperty(type))
        return self
    }

    /// Sets the stack order of a positioned element
    public func zIndex<V>(_ type: ExpressableState<V, Int>) -> Self {
        zIndex(type.unwrap())
    }
}
