//
//  TextUnderlinePosition.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the position of the underline which is set using the text-decoration property
///
/// ```html
/// /* Single keyword */
/// text-underline-position: auto;
/// text-underline-position: under;
/// text-underline-position: left;
/// text-underline-position: right;
///
/// /* Multiple keywords */
/// text-underline-position: under left;
/// text-underline-position: right under;
///
/// /* Global values */
/// text-underline-position: inherit;
/// text-underline-position: initial;
/// text-underline-position: unset;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/text-underline-position)
public class TextUnderlinePositionProperty: _Property {
    public var propertyKey: PropertyKey<[TextUnderlinePositionType]> { .textUnderlinePositions }
    public var propertyValue: [TextUnderlinePositionType]
    var _content = _PropertyContent<[TextUnderlinePositionType]>()
    
    public init (_ type: TextUnderlinePositionType...) {
        propertyValue = type
    }
    
    public init (_ types: [TextUnderlinePositionType]) {
        propertyValue = types
    }
    
    public convenience init <A>(_ value: A) where A: StateConvertible, A.Value == [TextUnderlinePositionType] {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen { self._changed(to: $0) }
    }
    
    public convenience init <A>(_ value: A) where A: StateConvertible, A.Value == TextUnderlinePositionType {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen { self._changed(to: [$0]) }
    }
}

extension PropertyKey {
    /// Specifies the position of the underline which is set using the text-decoration property
    public static var textUnderlinePositions: PropertyKey<[TextUnderlinePositionType]> { "text-underline-position".propertyKey() }
    /// Specifies the position of the underline which is set using the text-decoration property
    public static var textUnderlinePosition: PropertyKey<TextUnderlinePositionType> { "text-underline-position".propertyKey() }
}

extension Array where Element == TextUnderlinePositionType {
    public var description: String {
        map { $0.value }.joined(separator: " ")
    }
}

extension Stylesheet {
    /// Specifies the position of the underline which is set using the text-decoration property
    public typealias TextUnderlinePosition = TextUnderlinePositionProperty
}

extension CSSRulable {
    /// Specifies the position of the underline which is set using the text-decoration property
    public func textUnderlinePosition(_ type: TextUnderlinePositionType...) -> Self {
        textUnderlinePosition(type)
    }
    
    /// Specifies the position of the underline which is set using the text-decoration property
    public func textUnderlinePosition(_ types: [TextUnderlinePositionType]) -> Self {
        s?._addProperty(TextUnderlinePositionProperty(types))
        return self
    }

    /// Specifies the position of the underline which is set using the text-decoration property
    public func textUnderlinePosition<A>(_ value: A) -> Self where A: StateConvertible, A.Value == [TextUnderlinePositionType] {
        s?._addProperty(TextUnderlinePositionProperty(value))
        return self
    }
    
    /// Specifies the position of the underline which is set using the text-decoration property
    public func textUnderlinePosition<A>(_ value: A) -> Self where A: StateConvertible, A.Value == TextUnderlinePositionType {
        s?._addProperty(TextUnderlinePositionProperty(value))
        return self
    }
}
