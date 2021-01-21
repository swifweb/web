//
//  LineBreak.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies how/if to break lines
///
/// ```html
/// line-break: auto;
/// line-break: loose;
/// line-break: normal;
/// line-break: strict;
/// line-break: anywhere;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/line-break)
public class LineBreakProperty: _Property {
    public var propertyKey: PropertyKey<LineBreakType> { .lineBreak }
    public var propertyValue: LineBreakType
    var _content = _PropertyContent<LineBreakType>()
    
    public init (_ type: LineBreakType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<LineBreakType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, LineBreakType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how/if to break lines
    public static var lineBreak: PropertyKey<LineBreakType> { "line-break".propertyKey() }
}

extension Stylesheet {
    /// Specifies how/if to break lines
    public typealias LineBreak = LineBreakProperty
}

extension CSSRulable {
    /// Specifies how/if to break lines
    public func lineBreak(_ type: LineBreakType) -> Self {
        s?._addProperty(.lineBreak, type)
        return self
    }

    /// Specifies how/if to break lines
    public func lineBreak(_ type: State<LineBreakType>) -> Self {
        s?._addProperty(LineBreakProperty(type))
        return self
    }

    /// Specifies how/if to break lines
    public func lineBreak<V>(_ type: ExpressableState<V, LineBreakType>) -> Self {
        lineBreak(type.unwrap())
    }
}
