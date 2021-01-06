//
//  Position.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the type of positioning method used for an element (static, relative, absolute or fixed)
///
/// ```html
/// h2 {
///     position: absolute;
///     left: 100px;
///     top: 150px;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_position.asp)
public class PositionProperty: _Property {
    public var propertyKey: PropertyKey<PositionType> { .position }
    public var propertyValue: PositionType
    var _content = _PropertyContent<PositionType>()
    
    public init (_ type: PositionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<PositionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, PositionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the type of positioning method used for an element (static, relative, absolute or fixed)
    public static var position: PropertyKey<PositionType> { "position".propertyKey() }
}

extension Stylesheet {
    /// Specifies the type of positioning method used for an element (static, relative, absolute or fixed)
    public typealias Position = PositionProperty
}

extension CSSRulable {
    /// Specifies the type of positioning method used for an element (static, relative, absolute or fixed)
    public func position(_ type: PositionType) -> Self {
        s?._addProperty(.position, type)
        return self
    }

    /// Specifies the type of positioning method used for an element (static, relative, absolute or fixed)
    public func position(_ type: State<PositionType>) -> Self {
        s?._addProperty(PositionProperty(type))
        return self
    }

    /// Specifies the type of positioning method used for an element (static, relative, absolute or fixed)
    public func position<V>(_ type: ExpressableState<V, PositionType>) -> Self {
        position(type.unwrap())
    }
}
