//
//  BreakInside.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a page-, column-, or region-break should occur inside the specified element
///
/// ```html
/// break-inside: avoid;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_break-inside.asp)
public class BreakInsideProperty: _Property {
    public var propertyKey: PropertyKey<BreakInsideType> { .breakInside }
    public var propertyValue: BreakInsideType
    var _content = _PropertyContent<BreakInsideType>()
    
    public init (_ type: BreakInsideType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BreakInsideType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BreakInsideType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether or not a page-, column-, or region-break should occur inside the specified element
    public static var breakInside: PropertyKey<BreakInsideType> { "break-inside".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not a page-, column-, or region-break should occur inside the specified element
    public typealias BreakInside = BreakInsideProperty
}

extension CSSRulable {
    /// Specifies whether or not a page-, column-, or region-break should occur inside the specified element
    public func breakInside(_ type: BreakInsideType) -> Self {
        s?._addProperty(.breakInside, type)
        return self
    }

    /// Specifies whether or not a page-, column-, or region-break should occur inside the specified element
    public func breakInside(_ type: State<BreakInsideType>) -> Self {
        s?._addProperty(BreakInsideProperty(type))
        return self
    }

    /// Specifies whether or not a page-, column-, or region-break should occur inside the specified element
    public func breakInside<V>(_ type: ExpressableState<V, BreakInsideType>) -> Self {
        breakInside(type.unwrap())
    }
}
