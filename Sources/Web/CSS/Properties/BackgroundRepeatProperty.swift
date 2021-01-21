//
//  BackgroundRepeatProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets if/how a background image will be repeated
///
/// ```html
/// background-repeat: repeat-y;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-repeat.asp)
public class BackgroundRepeatProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundRepeatType> { .backgroundRepeat }
    public var propertyValue: BackgroundRepeatType
    var _content = _PropertyContent<BackgroundRepeatType>()
    
    public init (_ type: BackgroundRepeatType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BackgroundRepeatType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BackgroundRepeatType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets if/how a background image will be repeated
    public static var backgroundRepeat: PropertyKey<BackgroundRepeatType> { "background-repeat".propertyKey() }
}

extension Stylesheet {
    /// Sets if/how a background image will be repeated
    public typealias BackgroundRepeat = BackgroundRepeatProperty
}

extension CSSRulable {
    /// Sets if/how a background image will be repeated
    public func backgroundRepeat(_ type: BackgroundRepeatType) -> Self {
        s?._addProperty(.backgroundRepeat, type)
        return self
    }

    /// Sets if/how a background image will be repeated
    public func backgroundRepeat(_ type: State<BackgroundRepeatType>) -> Self {
        s?._addProperty(BackgroundRepeatProperty(type))
        return self
    }

    /// Sets if/how a background image will be repeated
    public func backgroundRepeat<V>(_ type: ExpressableState<V, BackgroundRepeatType>) -> Self {
        backgroundRepeat(type.unwrap())
    }
}
