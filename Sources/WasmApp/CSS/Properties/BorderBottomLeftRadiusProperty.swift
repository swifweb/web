//
//  BorderBottomLeftRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the bottom-left corner
///
/// ```html
/// border-bottom-left-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-bottom-left-radius.asp)
public class BorderBottomLeftRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderBottomLeftRadius }
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
    /// Defines the radius of the border of the bottom-left corner
    public static var borderBottomLeftRadius: PropertyKey<BorderRadiusType> { "border-bottom-left-radius".propertyKey() }
}

extension Stylesheet {
    /// Defines the radius of the border of the bottom-left corner
    public typealias BorderBottomLeftRadius = BorderBottomLeftRadiusProperty
}

extension CSSRulable {
    /// Defines the radius of the border of the bottom-left corner
    public func borderBottomLeftRadius(_ type: BorderRadiusType) -> Self {
        s?._addProperty(.borderBottomLeftRadius, type)
        return self
    }

    /// Defines the radius of the border of the bottom-left corner
    public func borderBottomLeftRadius(_ type: State<BorderRadiusType>) -> Self {
        s?._addProperty(BorderBottomLeftRadiusProperty(type))
        return self
    }

    /// Defines the radius of the border of the bottom-left corner
    public func borderBottomLeftRadius<V>(_ type: ExpressableState<V, BorderRadiusType>) -> Self {
        borderBottomLeftRadius(type.unwrap())
    }
}
