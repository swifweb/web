//
//  BorderStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the four borders
///
/// ```html
/// border-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-style.asp)
public class BorderStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleValue> { .borderStyle }
    public var propertyValue: BorderStyleValue
    var _content = _PropertyContent<BorderStyleValue>()
    
    public init (_ type: BorderStyleType...) {
        propertyValue = BorderStyleValue(type)
    }
    
    public init (_ type: [BorderStyleType]) {
        propertyValue = BorderStyleValue(type)
    }
    
    public convenience init <A>(_ type: A) where A: StateConvertible, A.Value == [BorderStyleType] {
        let state = type.stateValue
        self.init(state.wrappedValue)
        state.listen { self._changed(to: BorderStyleValue($0)) }
    }
    
    public convenience init <A>(_ type: A) where A: StateConvertible, A.Value == BorderStyleType {
        let state = type.stateValue
        self.init(state.wrappedValue)
        state.listen { self._changed(to: BorderStyleValue($0)) }
    }
}

extension PropertyKey {
    public static var borderStyle: PropertyKey<BorderStyleValue> { "border-style".propertyKey() }
}

public struct BorderStyleValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: BorderStyleType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [BorderStyleType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Sets the style of the four borders
    public typealias BorderStyle = BorderStyleProperty
}

extension CSSRulable {
    /// Sets the style of the four borders
    public func borderStyle(_ type: BorderStyleType...) -> Self {
        borderStyle(type)
    }
    
    /// Sets the style of the four borders
    public func borderStyle(_ type: [BorderStyleType]) -> Self {
        s?._addProperty(BorderStyleProperty(type))
        return self
    }
    
    /// Sets the style of the four borders
    public func borderStyle<A>(_ type: A) -> Self where A: StateConvertible, A.Value == [BorderStyleType] {
        s?._addProperty(BorderStyleProperty(type))
        return self
    }
    
    /// Sets the style of the four borders
    public func borderStyle<A>(_ type: A) -> Self where A: StateConvertible, A.Value == BorderStyleType {
        s?._addProperty(BorderStyleProperty(type))
        return self
    }
}
