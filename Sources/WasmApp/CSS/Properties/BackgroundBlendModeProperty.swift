//
//  BackgroundBlendModeProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the blending mode of each background layer (color/image)
///
/// ```html
/// background-blend-mode: lighten;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-blend-mode.asp)
public class BackgroundBlendModeProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundBlendModeType> { .backgroundBlendMode }
    public var propertyValue: BackgroundBlendModeType
    var _content = _PropertyContent<BackgroundBlendModeType>()
    
    public init (_ type: BackgroundBlendModeType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BackgroundBlendModeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BackgroundBlendModeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the blending mode of each background layer (color/image)
    public static var backgroundBlendMode: PropertyKey<BackgroundBlendModeType> { "background-blend-mode".propertyKey() }
}

extension Stylesheet {
    /// Specifies the blending mode of each background layer (color/image)
    public typealias BackgroundBlendMode = BackgroundBlendModeProperty
}

extension CSSRulable {
    /// Specifies the blending mode of each background layer (color/image)
    public func backgroundBlendMode(_ type: BackgroundBlendModeType) -> Self {
        s?._addProperty(.backgroundBlendMode, type)
        return self
    }

    /// Specifies the blending mode of each background layer (color/image)
    public func backgroundBlendMode(_ type: State<BackgroundBlendModeType>) -> Self {
        s?._addProperty(BackgroundBlendModeProperty(type))
        return self
    }

    /// Specifies the blending mode of each background layer (color/image)
    public func backgroundBlendMode<V>(_ type: ExpressableState<V, BackgroundBlendModeType>) -> Self {
        backgroundBlendMode(type.unwrap())
    }
}
