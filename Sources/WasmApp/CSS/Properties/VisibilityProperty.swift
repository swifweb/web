//
//  Visibility.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies whether or not an element is visible
///
/// ```html
/// h2.a {
///     visibility: visible;
/// }
///
/// h2.b {
///     visibility: hidden;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_visibility.asp)
public class VisibilityProperty: _Property {
    public var propertyKey: PropertyKey<VisibilityType> { .visibility }
    public var propertyValue: VisibilityType
    var _content = _PropertyContent<VisibilityType>()
    
    public init (_ type: VisibilityType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<VisibilityType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, VisibilityType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether or not an element is visible
    public static var visibility: PropertyKey<VisibilityType> { "visibility".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not an element is visible
    public typealias Visibility = VisibilityProperty
}

extension CSSRulable {
    /// Specifies whether or not an element is visible
    public func visibility(_ type: VisibilityType) -> Self {
        s?._addProperty(.visibility, type)
        return self
    }

    /// Specifies whether or not an element is visible
    public func visibility(_ type: State<VisibilityType>) -> Self {
        s?._addProperty(VisibilityProperty(type))
        return self
    }

    /// Specifies whether or not an element is visible
    public func visibility<V>(_ type: ExpressableState<V, VisibilityType>) -> Self {
        visibility(type.unwrap())
    }
}
