//
//  BreakAfter.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a page-, column-, or region-break should occur after the specified element
///
/// ```html
/// break-after: always;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_break-after.asp)
public class BreakAfterProperty: _Property {
    public var propertyKey: PropertyKey<BreakType> { .breakAfter }
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
    /// Specifies whether or not a page-, column-, or region-break should occur after the specified element
    public static var breakAfter: PropertyKey<BreakType> { "break-after".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not a page-, column-, or region-break should occur after the specified element
    public typealias BreakAfter = BreakAfterProperty
}

extension CSSRulable {
    /// Specifies whether or not a page-, column-, or region-break should occur after the specified element
    public func breakAfter(_ type: BreakType) -> Self {
        s?._addProperty(.breakAfter, type)
        return self
    }

    /// Specifies whether or not a page-, column-, or region-break should occur after the specified element
    public func breakAfter(_ type: State<BreakType>) -> Self {
        s?._addProperty(BreakAfterProperty(type))
        return self
    }

    /// Specifies whether or not a page-, column-, or region-break should occur after the specified element
    public func breakAfter<V>(_ type: ExpressableState<V, BreakType>) -> Self {
        breakAfter(type.unwrap())
    }
}
