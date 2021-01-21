//
//  BorderImageRepeatProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies whether the border image should be repeated, rounded or stretched
///
/// ```html
/// border-image-repeat: repeat;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-repeat.asp)
public class BorderImageRepeatProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageRepeatType> { .borderImageRepeat }
    public var propertyValue: BorderImageRepeatType
    var _content = _PropertyContent<BorderImageRepeatType>()
    
    public init (_ type: BorderImageRepeatType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BorderImageRepeatType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderImageRepeatType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether the border image should be repeated, rounded or stretched
    public static var borderImageRepeat: PropertyKey<BorderImageRepeatType> { "border-image-repeat".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether the border image should be repeated, rounded or stretched
    public typealias BorderImageRepeat = BorderImageRepeatProperty
}

extension CSSRulable {
    /// Specifies whether the border image should be repeated, rounded or stretched
    public func borderImageRepeat(_ type: BorderImageRepeatType) -> Self {
        s?._addProperty(.borderImageRepeat, type)
        return self
    }

    /// Specifies whether the border image should be repeated, rounded or stretched
    public func borderImageRepeat(_ type: State<BorderImageRepeatType>) -> Self {
        s?._addProperty(BorderImageRepeatProperty(type))
        return self
    }

    /// Specifies whether the border image should be repeated, rounded or stretched
    public func borderImageRepeat<V>(_ type: ExpressableState<V, BorderImageRepeatType>) -> Self {
        borderImageRepeat(type.unwrap())
    }
}
