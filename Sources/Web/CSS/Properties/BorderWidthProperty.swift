//
//  BorderWidthProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the four borders
///
/// ```html
/// border-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-width.asp)
public class BorderWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthValue> { .borderWidth }
    public var propertyValue: BorderWidthValue
    var _content = _PropertyContent<BorderWidthValue>()
    
    public init (_ type: BorderWidthType...) {
        propertyValue = BorderWidthValue(type)
    }
    
    public init (_ type: [BorderWidthType]) {
        propertyValue = BorderWidthValue(type)
    }
    
    public convenience init <A>(_ type: A) where A: StateConvertible, A.Value == [BorderWidthType] {
        let state = type.stateValue
        self.init(state.wrappedValue)
        state.listen { self._changed(to: BorderWidthValue($0)) }
    }
    
    public convenience init <A>(_ type: A) where A: StateConvertible, A.Value == BorderWidthType {
        let state = type.stateValue
        self.init(state.wrappedValue)
        state.listen { self._changed(to: BorderWidthValue($0)) }
    }
}

extension PropertyKey {
    /// Sets the width of the four borders
    public static var borderWidth: PropertyKey<BorderWidthValue> { "border-width".propertyKey() }
}

public struct BorderWidthValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: BorderWidthType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [BorderWidthType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Sets the width of the four borders
    public typealias BorderWidth = BorderWidthProperty
}

extension CSSRulable {
    /// Sets the width of the four borders
    public func borderWidth(_ type: BorderWidthType...) -> Self {
        borderWidth(type)
    }
    
    /// Sets the width of the four borders
    public func borderWidth(_ type: [BorderWidthType]) -> Self {
        s?._addProperty(BorderWidthProperty(type))
        return self
    }
    
    /// Sets the width of the four borders
    public func borderWidth<A>(_ type: A) -> Self where A: StateConvertible, A.Value == [BorderWidthType] {
        s?._addProperty(BorderWidthProperty(type))
        return self
    }
    
    /// Sets the width of the four borders
    public func borderWidth<A>(_ type: A) -> Self where A: StateConvertible, A.Value == BorderWidthType {
        s?._addProperty(BorderWidthProperty(type))
        return self
    }
}
