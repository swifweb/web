//
//  AnimationName.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies a name for the @keyframes animation
///
/// ```html
/// animation-name: mymove;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-name.asp)
public class AnimationNameProperty: _Property {
    public var propertyKey: PropertyKey<String> { .animationName }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ name: String) {
        propertyValue = name
    }
    
    public convenience init (_ type: State<String>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, String>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies a name for the @keyframes animation
    public static var animationName: PropertyKey<String> { "animation-name".propertyKey() }
}

extension Stylesheet {
    /// Specifies a name for the @keyframes animation
    public typealias AnimationName = AnimationNameProperty
}

extension CSSRulable {
    /// Specifies a name for the @keyframes animation
    public func animationName(_ type: String) -> Self {
        s?._addProperty(.animationName, type)
        return self
    }

    /// Specifies a name for the @keyframes animation
    public func animationName(_ type: State<String>) -> Self {
        s?._addProperty(AnimationNameProperty(type))
        return self
    }

    /// Specifies a name for the @keyframes animation
    public func animationName<V>(_ type: ExpressableState<V, String>) -> Self {
        animationName(type.unwrap())
    }
}
