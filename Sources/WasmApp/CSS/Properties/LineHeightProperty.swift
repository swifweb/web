//
//  LineHeight.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the line height
///
/// ```html
/// line-height: normal;
/// line-height: 1.6;
/// line-height: 80%;
/// line-height: 200%;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_line-height.asp)
public class LineHeightProperty: _Property {
    public var propertyKey: PropertyKey<LineHeightType> { .lineHeight }
    public var propertyValue: LineHeightType
    var _content = _PropertyContent<LineHeightType>()
    
    public init (_ type: LineHeightType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<LineHeightType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, LineHeightType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the line height
    public static var lineHeight: PropertyKey<LineHeightType> { "line-height".propertyKey() }
}

extension Stylesheet {
    /// Sets the line height
    public typealias LineHeight = LineHeightProperty
}

extension CSSRulable {
    /// Sets the line height
    public func lineHeight(_ type: LineHeightType) -> Self {
        s?._addProperty(.lineHeight, type)
        return self
    }

    /// Sets the line height
    public func lineHeight(_ type: State<LineHeightType>) -> Self {
        s?._addProperty(LineHeightProperty(type))
        return self
    }

    /// Sets the line height
    public func lineHeight<V>(_ type: ExpressableState<V, LineHeightType>) -> Self {
        lineHeight(type.unwrap())
    }
}
