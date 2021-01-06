//
//  BorderImageWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the width of the border image
///
/// ```html
/// border-image-width: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-width.asp)
public class BorderImageWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderImageWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BorderWidthType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderWidthType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the width of the border image
    public static var borderImageWidth: PropertyKey<BorderWidthType> { "border-image-width".propertyKey() }
}

extension Stylesheet {
    /// Specifies the width of the border image
    public typealias BorderImageWidth = BorderImageWidthProperty
}

extension CSSRulable {
    /// Specifies the width of the border image
    public func borderImageWidth(_ type: BorderWidthType) -> Self {
        s?._addProperty(.borderImageWidth, type)
        return self
    }

    /// Specifies the width of the border image
    public func borderImageWidth(_ type: State<BorderWidthType>) -> Self {
        s?._addProperty(BorderImageWidthProperty(type))
        return self
    }

    /// Specifies the width of the border image
    public func borderImageWidth<V>(_ type: ExpressableState<V, BorderWidthType>) -> Self {
        borderImageWidth(type.unwrap())
    }
}
