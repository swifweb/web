//
//  Orphans.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element
///
/// ```html
/// orphans: 2;
/// orphans: 3;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/orphans)
public class OrphansProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .orphans }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ v: Int) {
        propertyValue = v
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
    /// Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element
    public static var orphans: PropertyKey<Int> { "orphans".propertyKey() }
}

extension Stylesheet {
    /// Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element
    public typealias Orphans = OrphansProperty
}

extension CSSRulable {
    /// Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element
    public func orphans(_ type: Int) -> Self {
        s?._addProperty(.orphans, type)
        return self
    }

    /// Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element
    public func orphans(_ type: State<Int>) -> Self {
        s?._addProperty(OrphansProperty(type))
        return self
    }

    /// Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element
    public func orphans<V>(_ type: ExpressableState<V, Int>) -> Self {
        orphans(type.unwrap())
    }
}
