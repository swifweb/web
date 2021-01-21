//
//  Direction.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the text direction/writing direction
///
/// ```html
/// direction: rtl;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_direction.asp)
public class DirectionProperty: _Property {
    public var propertyKey: PropertyKey<DirectionType> { .direction }
    public var propertyValue: DirectionType
    var _content = _PropertyContent<DirectionType>()
    
    public init (_ type: DirectionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<DirectionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, DirectionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the text direction/writing direction
    public static var direction: PropertyKey<DirectionType> { "direction".propertyKey() }
}

extension Stylesheet {
    /// Specifies the text direction/writing direction
    public typealias Direction = DirectionProperty
}

extension CSSRulable {
    /// Specifies the text direction/writing direction
    public func direction(_ type: DirectionType) -> Self {
        s?._addProperty(.direction, type)
        return self
    }

    /// Specifies the text direction/writing direction
    public func direction(_ type: State<DirectionType>) -> Self {
        s?._addProperty(DirectionProperty(type))
        return self
    }

    /// Specifies the text direction/writing direction
    public func direction<V>(_ type: ExpressableState<V, DirectionType>) -> Self {
        direction(type.unwrap())
    }
}
