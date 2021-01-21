//
//  FlexDirectionProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the direction of the flexible items
///
/// ```html
/// flex-direction: row-reverse;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-direction.asp)
public class FlexDirectionProperty: _Property {
    public var propertyKey: PropertyKey<FlexDirectionType> { .flexDirection }
    public var propertyValue: FlexDirectionType
    var _content = _PropertyContent<FlexDirectionType>()
    
    public init (_ type: FlexDirectionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FlexDirectionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FlexDirectionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the direction of the flexible items
    public static var flexDirection: PropertyKey<FlexDirectionType> { "flex-direction".propertyKey() }
}

extension Stylesheet {
    /// Specifies the direction of the flexible items
    public typealias FlexDirection = FlexDirectionProperty
}

extension CSSRulable {
    /// Specifies the direction of the flexible items
    public func flexDirection(_ type: FlexDirectionType) -> Self {
        s?._addProperty(.flexDirection, type)
        return self
    }

    /// Specifies the direction of the flexible items
    public func flexDirection(_ type: State<FlexDirectionType>) -> Self {
        s?._addProperty(FlexDirectionProperty(type))
        return self
    }

    /// Specifies the direction of the flexible items
    public func flexDirection<V>(_ type: ExpressableState<V, FlexDirectionType>) -> Self {
        flexDirection(type.unwrap())
    }
}
