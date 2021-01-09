//
//  Widows.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element
public class WidowsProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .widows }
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
    /// Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element
    public static var widows: PropertyKey<Int> { "widows".propertyKey() }
}

extension Stylesheet {
    /// Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element
    public typealias Widows = WidowsProperty
}

extension CSSRulable {
    /// Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element
    public func widows(_ type: Int) -> Self {
        s?._addProperty(.widows, type)
        return self
    }

    /// Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element
    public func widows(_ type: State<Int>) -> Self {
        s?._addProperty(WidowsProperty(type))
        return self
    }

    /// Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element
    public func widows<V>(_ type: ExpressableState<V, Int>) -> Self {
        widows(type.unwrap())
    }
}
