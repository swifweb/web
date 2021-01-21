//
//  BorderImageSliceProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies how to slice the border image
///
/// ```html
/// border-image-slice: 30%;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-slice.asp)
public class BorderImageSliceProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageSliceType> { .borderImageSlice }
    public var propertyValue: BorderImageSliceType
    var _content = _PropertyContent<BorderImageSliceType>()
    
    public init (_ type: BorderImageSliceType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BorderImageSliceType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderImageSliceType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how to slice the border image
    public static var borderImageSlice: PropertyKey<BorderImageSliceType> { "border-image-slice".propertyKey() }
}

extension Stylesheet {
    /// Specifies how to slice the border image
    public typealias BorderImageSlice = BorderImageSliceProperty
}

extension CSSRulable {
    /// Specifies how to slice the border image
    public func borderImageSlice(_ type: BorderImageSliceType) -> Self {
        s?._addProperty(.borderImageSlice, type)
        return self
    }

    /// Specifies how to slice the border image
    public func borderImageSlice(_ type: State<BorderImageSliceType>) -> Self {
        s?._addProperty(BorderImageSliceProperty(type))
        return self
    }

    /// Specifies how to slice the border image
    public func borderImageSlice<V>(_ type: ExpressableState<V, BorderImageSliceType>) -> Self {
        borderImageSlice(type.unwrap())
    }
}
