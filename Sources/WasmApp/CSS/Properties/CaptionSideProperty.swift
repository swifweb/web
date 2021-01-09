//
//  CaptionSide.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the placement of a table caption
///
/// ```html
/// caption-side: bottom;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_tab_caption-side.asp)
public class CaptionSideProperty: _Property {
    public var propertyKey: PropertyKey<CaptionSideType> { .captionSide }
    public var propertyValue: CaptionSideType
    var _content = _PropertyContent<CaptionSideType>()
    
    public init (_ type: CaptionSideType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<CaptionSideType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, CaptionSideType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the placement of a table caption
    public static var captionSide: PropertyKey<CaptionSideType> { "caption-side".propertyKey() }
}

extension Stylesheet {
    /// Specifies the placement of a table caption
    public typealias CaptionSide = CaptionSideProperty
}

extension CSSRulable {
    /// Specifies the placement of a table caption
    public func captionSide(_ type: CaptionSideType) -> Self {
        s?._addProperty(.captionSide, type)
        return self
    }

    /// Specifies the placement of a table caption
    public func captionSide(_ type: State<CaptionSideType>) -> Self {
        s?._addProperty(CaptionSideProperty(type))
        return self
    }

    /// Specifies the placement of a table caption
    public func captionSide<V>(_ type: ExpressableState<V, CaptionSideType>) -> Self {
        captionSide(type.unwrap())
    }
}
