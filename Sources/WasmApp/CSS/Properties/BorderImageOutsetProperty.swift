//
//  BorderImageOutsetProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the amount by which the border image area extends beyond the border box
///
/// ```html
/// border-image-outset: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-outset.asp)
public class BorderImageOutsetProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageOutsetType> { .borderImageOutset }
    public var propertyValue: BorderImageOutsetType
    var _content = _PropertyContent<BorderImageOutsetType>()
    
    public init (_ type: BorderImageOutsetType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BorderImageOutsetType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderImageOutsetType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the amount by which the border image area extends beyond the border box
    public static var borderImageOutset: PropertyKey<BorderImageOutsetType> { "border-image-outset".propertyKey() }
}

extension Stylesheet {
    /// Specifies the amount by which the border image area extends beyond the border box
    public typealias BorderImageOutset = BorderImageOutsetProperty
}

extension CSSRulable {
    /// Specifies the amount by which the border image area extends beyond the border box
    public func borderImageOutset(_ type: BorderImageOutsetType) -> Self {
        s?._addProperty(.borderImageOutset, type)
        return self
    }

    /// Specifies the amount by which the border image area extends beyond the border box
    public func borderImageOutset(_ type: State<BorderImageOutsetType>) -> Self {
        s?._addProperty(BorderImageOutsetProperty(type))
        return self
    }

    /// Specifies the amount by which the border image area extends beyond the border box
    public func borderImageOutset<V>(_ type: ExpressableState<V, BorderImageOutsetType>) -> Self {
        borderImageOutset(type.unwrap())
    }
    
    /// Specifies the amount by which the border image area extends beyond the border box
    public func borderImageOutset<L: UnitValuable>(_ length: L) -> Self {
        borderImageOutset(.length(length)
    }
    
    /// Specifies the amount by which the border image area extends beyond the border box
    public func borderImageOutset<L: UnitValuable>(_ type: State<L>) -> Self {
        borderImageOutset(type.map { .length($0) })
    }

    /// Specifies the amount by which the border image area extends beyond the border box
    public func borderImageOutset<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        borderImageOutset(type.unwrap())
    }
}
