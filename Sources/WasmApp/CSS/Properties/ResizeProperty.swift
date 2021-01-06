//
//  Resize.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines if (and how) an element is resizable by the user
///
/// ```html
/// div {
///     resize: both;
///     overflow: auto;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_resize.asp)
public class ResizeProperty: _Property {
    public var propertyKey: PropertyKey<ResizeType> { .resize }
    public var propertyValue: ResizeType
    var _content = _PropertyContent<ResizeType>()
    
    public init (_ type: ResizeType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ResizeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ResizeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines if (and how) an element is resizable by the user
    public static var resize: PropertyKey<ResizeType> { "resize".propertyKey() }
}

extension Stylesheet {
    /// Defines if (and how) an element is resizable by the user
    public typealias Resize = ResizeProperty
}

extension CSSRulable {
    /// Defines if (and how) an element is resizable by the user
    public func resize(_ type: ResizeType) -> Self {
        s?._addProperty(.resize, type)
        return self
    }

    /// Defines if (and how) an element is resizable by the user
    public func resize(_ type: State<ResizeType>) -> Self {
        s?._addProperty(ResizeProperty(type))
        return self
    }

    /// Defines if (and how) an element is resizable by the user
    public func resize<V>(_ type: ExpressableState<V, ResizeType>) -> Self {
        resize(type.unwrap())
    }
}
