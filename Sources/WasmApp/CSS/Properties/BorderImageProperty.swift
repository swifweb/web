//
//  BorderImageProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for all the border-image-* properties
///
/// ```html
/// border-image: url(border.png) 30 round;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image.asp)
public class BorderImageProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageValue> { .borderImage }
    public var propertyValue: BorderImageValue
    var _content = _PropertyContent<BorderImageValue>()
    
    public init (_ value: BorderImageValue) {
        propertyValue = value
    }
    
    public convenience init (_ type: State<BorderImageValue>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderImageValue>) {
        self.init(type.unwrap())
    }
    
    public init (
        source: String,
        slice: BorderImageSliceType? = nil,
        width: BorderWidthType? = nil,
        outset: BorderImageOutsetType? = nil,
        repeat: BorderImageRepeatType? = nil
    ) {
        propertyValue = BorderImageValue(source: source, slice: slice, width: width, outset: outset, repeat: `repeat`)
    }
}

extension PropertyKey {
    public static var borderImage: PropertyKey<BorderImageValue> { "border-image".propertyKey() }
}

public struct BorderImageValue: CustomStringConvertible {
    public let value: String
    
    public init (
        source: String,
        slice: BorderImageSliceType? = nil,
        width: BorderWidthType? = nil,
        outset: BorderImageOutsetType? = nil,
        repeat: BorderImageRepeatType? = nil
    ) {
        value = ["url(\(source)", slice?.value, width?.value, outset?.value, `repeat`?.value].compactMap { $0 }.joined(separator: " ")
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for all the border-image-* properties
    public typealias BorderImage = BorderImageProperty
}

extension CSSRulable {
    /// A shorthand property for all the border-image-* properties
    public func borderImage(_ type: BorderImageValue) -> Self {
        s?._addProperty(.borderImage, type)
        return self
    }

    /// A shorthand property for all the border-image-* properties
    public func borderImage(_ type: State<BorderImageValue>) -> Self {
        s?._addProperty(BorderImageProperty(type))
        return self
    }

    /// A shorthand property for all the border-image-* properties
    public func borderImage<V>(_ type: ExpressableState<V, BorderImageValue>) -> Self {
        borderImage(type.unwrap())
    }
    
    /// A shorthand property for all the border-image-* properties
    public func borderImage(
        source: String,
        slice: BorderImageSliceType? = nil,
        width: BorderWidthType? = nil,
        outset: BorderImageOutsetType? = nil,
        repeat: BorderImageRepeatType? = nil
    ) -> Self {
        s?._addProperty(BorderImageProperty(source: source, slice: slice, width: width, outset: outset, repeat: `repeat`))
        return self
    }
}
