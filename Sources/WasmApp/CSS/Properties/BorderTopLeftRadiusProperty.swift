//
//  BorderTopLeftRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the top-left corner
///
/// ```html
/// border-top-left-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-top-left-radius.asp)
public class BorderTopLeftRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderTopLeftRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
    
    public convenience init (_ type: State<BorderRadiusType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderRadiusType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines the radius of the border of the top-left corner
    public static var borderTopLeftRadius: PropertyKey<BorderRadiusType> { "border-top-left-radius".propertyKey() }
}

extension Stylesheet {
    /// Defines the radius of the border of the top-left corner
    public typealias BorderTopLeftRadius = BorderTopLeftRadiusProperty
}

extension CSSRulable {
    /// Defines the radius of the border of the top-left corner
    public func borderTopLeftRadius(_ type: BorderRadiusType) -> Self {
        s?._addProperty(.borderTopLeftRadius, type)
        return self
    }

    /// Defines the radius of the border of the top-left corner
    public func borderTopLeftRadius(_ type: State<BorderRadiusType>) -> Self {
        s?._addProperty(BorderTopLeftRadiusProperty(type))
        return self
    }

    /// Defines the radius of the border of the top-left corner
    public func borderTopLeftRadius<V>(_ type: ExpressableState<V, BorderRadiusType>) -> Self {
        borderTopLeftRadius(type.unwrap())
    }
    
    /// Defines the radius of the border of the top-left corner
    public func borderTopLeftRadius<L: UnitValuable>(_ length: L) -> Self {
        borderTopLeftRadius(.length(length))
    }
    
    /// Defines the radius of the border of the top-left corner
    public func borderTopLeftRadius<L: UnitValuable>(_ type: State<L>) -> Self {
        borderTopLeftRadius(type.map { .length($0) })
    }

    /// Defines the radius of the border of the top-left corner
    public func borderTopLeftRadius<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        borderTopLeftRadius(type.unwrap())
    }
}
