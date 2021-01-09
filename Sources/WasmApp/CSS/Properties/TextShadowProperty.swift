//
//  TextShadow.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Adds shadow to text
///
/// ```html
/// h1 {
///     text-shadow: 2px 2px #ff0000;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-shadow.asp)
public class TextShadowProperty: _Property {
    public var propertyKey: PropertyKey<[TextShadowType]> { .textShadows }
    public var propertyValue: [TextShadowType]
    var _content = _PropertyContent<[TextShadowType]>()
    
    public init (_ type: TextShadowType...) {
        propertyValue = type
    }
    
    public init (_ type: [TextShadowType]) {
        propertyValue = type
    }
    
    public convenience init <A>(_ value: A) where A: StateConvertible, A.Value == [TextShadowType] {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen { self._changed(to: $0) }
    }
    
    public convenience init <A>(_ value: A) where A: StateConvertible, A.Value == TextShadowType {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen { self._changed(to: [$0]) }
    }
}

extension PropertyKey {
    /// Adds shadow to text
    public static var textShadows: PropertyKey<[TextShadowType]> { "text-shadow".propertyKey() }
    /// Adds shadow to text
    public static var textShadow: PropertyKey<TextShadowType> { "text-shadow".propertyKey() }
}

extension Array where Element == TextShadowType {
    public var description: String {
        map { $0.value }.joined(separator: ", ")
    }
}

extension Stylesheet {
    /// Adds shadow to text
    public typealias TextShadow = TextShadowProperty
}

extension CSSRulable {
    /// Adds shadow to text
    public func textShadow(_ type: TextShadowType...) -> Self {
        textShadow(type)
    }
    
    /// Adds shadow to text
    public func textShadow(_ types: [TextShadowType]) -> Self {
        s?._addProperty(TextShadowProperty(types))
        return self
    }

    /// Adds shadow to text
    public func textShadow<A>(_ value: A) -> Self where A: StateConvertible, A.Value == [TextShadowType] {
        s?._addProperty(TextShadowProperty(value))
        return self
    }
    
    /// Adds shadow to text
    public func textShadow<A>(_ value: A) -> Self where A: StateConvertible, A.Value == TextShadowType {
        s?._addProperty(TextShadowProperty(value))
        return self
    }
}
