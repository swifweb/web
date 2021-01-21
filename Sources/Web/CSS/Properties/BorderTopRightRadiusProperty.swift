//
//  BorderTopRightRadiusProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the top-right corner
///
/// ```html
/// border-top-right-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-top-right-radius.asp)
public class BorderTopRightRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderTopRightRadius }
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
    /// Defines the radius of the border of the top-right corner
    public static var borderTopRightRadius: PropertyKey<BorderRadiusType> { "border-top-right-radius".propertyKey() }
}

extension Stylesheet {
    /// Defines the radius of the border of the top-right corner
    public typealias BorderTopRightRadius = BorderTopRightRadiusProperty
}

extension CSSRulable {
    /// Defines the radius of the border of the top-right corner
    public func borderTopRightRadius(_ type: BorderRadiusType) -> Self {
        s?._addProperty(.borderTopRightRadius, type)
        return self
    }

    /// Defines the radius of the border of the top-right corner
    public func borderTopRightRadius(_ type: State<BorderRadiusType>) -> Self {
        s?._addProperty(BorderTopRightRadiusProperty(type))
        return self
    }

    /// Defines the radius of the border of the top-right corner
    public func borderTopRightRadius<V>(_ type: ExpressableState<V, BorderRadiusType>) -> Self {
        borderTopRightRadius(type.unwrap())
    }
    
    /// Defines the radius of the border of the top-right corner
    public func borderTopRightRadius<L: UnitValuable>(_ length: L) -> Self {
        borderTopRightRadius(.length(length))
    }
    
    /// Defines the radius of the border of the top-right corner
    public func borderTopRightRadius<L: UnitValuable>(_ type: State<L>) -> Self {
        borderTopRightRadius(type.map { .length($0) })
    }

    /// Defines the radius of the border of the top-right corner
    public func borderTopRightRadius<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        borderTopRightRadius(type.unwrap())
    }
}
