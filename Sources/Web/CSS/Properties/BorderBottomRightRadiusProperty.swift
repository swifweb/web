//
//  BorderBottomRightRadiusProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the bottom-right corner
///
/// ```html
/// border-bottom-right-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-bottom-right-radius.asp)
public class BorderBottomRightRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderBottomRightRadius }
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
    /// Defines the radius of the border of the bottom-right corner
    public static var borderBottomRightRadius: PropertyKey<BorderRadiusType> { "_border-bottom-right-radius__".propertyKey() }
}

extension Stylesheet {
    /// Defines the radius of the border of the bottom-right corner
    public typealias BorderBottomRightRadius = BorderBottomRightRadiusProperty
}

extension CSSRulable {
    /// Defines the radius of the border of the bottom-right corner
    public func borderBottomRightRadius(_ type: BorderRadiusType) -> Self {
        s?._addProperty(.borderBottomRightRadius, type)
        return self
    }

    /// Defines the radius of the border of the bottom-right corner
    public func borderBottomRightRadius(_ type: State<BorderRadiusType>) -> Self {
        s?._addProperty(BorderBottomRightRadiusProperty(type))
        return self
    }

    /// Defines the radius of the border of the bottom-right corner
    public func borderBottomRightRadius<V>(_ type: ExpressableState<V, BorderRadiusType>) -> Self {
        borderBottomRightRadius(type.unwrap())
    }
    
    /// Defines the radius of the border of the bottom-right corner
    public func borderBottomRightRadius<L: UnitValuable>(_ length: L) -> Self {
        borderBottomRightRadius(.length(length))
    }
    
    /// Defines the radius of the border of the bottom-right corner
    public func borderBottomRightRadius<L: UnitValuable>(_ type: State<L>) -> Self {
        borderBottomRightRadius(type.map { .length($0) })
    }

    /// Defines the radius of the border of the bottom-right corner
    public func borderBottomRightRadius<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        borderBottomRightRadius(type.unwrap())
    }
}