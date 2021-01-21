//
//  BreakBefore.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a page-, column-, or region-break should occur before the specified element
///
/// ```html
/// break-before: always;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_break-before.asp)
public class BreakBeforeProperty: _Property {
    public var propertyKey: PropertyKey<BreakType> { .breakBefore }
    public var propertyValue: BreakType
    var _content = _PropertyContent<BreakType>()
    
    public init (_ type: BreakType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BreakType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BreakType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether or not a page-, column-, or region-break should occur before the specified element
    public static var breakBefore: PropertyKey<BreakType> { "break-before".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not a page-, column-, or region-break should occur before the specified element
    public typealias BreakBefore = BreakBeforeProperty
}

extension CSSRulable {
    /// Specifies whether or not a page-, column-, or region-break should occur before the specified element
    public func breakBefore(_ type: BreakType) -> Self {
        s?._addProperty(.breakBefore, type)
        return self
    }

    /// Specifies whether or not a page-, column-, or region-break should occur before the specified element
    public func breakBefore(_ type: State<BreakType>) -> Self {
        s?._addProperty(BreakBeforeProperty(type))
        return self
    }

    /// Specifies whether or not a page-, column-, or region-break should occur before the specified element
    public func breakBefore<V>(_ type: ExpressableState<V, BreakType>) -> Self {
        breakBefore(type.unwrap())
    }
}
