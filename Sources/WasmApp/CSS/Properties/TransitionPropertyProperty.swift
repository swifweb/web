//
//  TransitionProperty.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the name of the CSS property the transition effect is for
///
/// ```html
/// div {
///     transition-property: width;
/// }
///
/// div:hover {
///     width: 300px;
/// }
/// ```
///
/// ```html
/// div {
///     transition-property: width, height;
/// }
///
/// div:hover {
///     width: 300px;
///     height: 300px;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-property.asp)
public class TransitionPropertyProperty: _Property {
    public var propertyKey: PropertyKey<TransitionPropertyType> { .transitionProperty }
    public var propertyValue: TransitionPropertyType
    var _content = _PropertyContent<TransitionPropertyType>()
    
    public init (_ type: TransitionPropertyType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TransitionPropertyType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TransitionPropertyType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the name of the CSS property the transition effect is for
    public static var transitionProperty: PropertyKey<TransitionPropertyType> { "transition-property".propertyKey() }
}

extension Stylesheet {
    /// Specifies the name of the CSS property the transition effect is for
    public typealias TransitionProperty = TransitionPropertyProperty
}

extension CSSRulable {
    /// Specifies the name of the CSS property the transition effect is for
    public func transitionProperty(_ type: TransitionPropertyType) -> Self {
        s?._addProperty(.transitionProperty, type)
        return self
    }

    /// Specifies the name of the CSS property the transition effect is for
    public func transitionProperty(_ type: State<TransitionPropertyType>) -> Self {
        s?._addProperty(TransitionPropertyProperty(type))
        return self
    }

    /// Specifies the name of the CSS property the transition effect is for
    public func transitionProperty<V>(_ type: ExpressableState<V, TransitionPropertyType>) -> Self {
        transitionProperty(type.unwrap())
    }
}
