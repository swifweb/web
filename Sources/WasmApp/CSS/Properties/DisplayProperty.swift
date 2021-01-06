//
//  Display.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how a certain HTML element should be displayed
///
/// ```html
/// display: block;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_display.asp)
public class DisplayProperty: _Property {
    public var propertyKey: PropertyKey<DisplayType> { .display }
    public var propertyValue: DisplayType
    var _content = _PropertyContent<DisplayType>()
    
    public init (_ type: DisplayType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<DisplayType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, DisplayType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how a certain HTML element should be displayed
    public static var display: PropertyKey<DisplayType> { "display".propertyKey() }
}

extension Stylesheet {
    /// Specifies how a certain HTML element should be displayed
    public typealias Display = DisplayProperty
}

extension CSSRulable {
    /// Specifies how a certain HTML element should be displayed
    public func display(_ type: DisplayType) -> Self {
        s?._addProperty(.display, type)
        return self
    }

    /// Specifies how a certain HTML element should be displayed
    public func display(_ type: State<DisplayType>) -> Self {
        s?._addProperty(DisplayProperty(type))
        return self
    }

    /// Specifies how a certain HTML element should be displayed
    public func display<V>(_ type: ExpressableState<V, DisplayType>) -> Self {
        display(type.unwrap())
    }
}
