//
//  BackfaceVisibility.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Defines whether or not the back face of an element should be visible when facing the user
///
/// ```html
/// backface-visibility: hidden;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_backface-visibility.asp)
public class BackfaceVisibilityProperty: _Property {
    public var propertyKey: PropertyKey<BackfaceVisibilityType> { .backfaceVisibility }
    public var propertyValue: BackfaceVisibilityType
    var _content = _PropertyContent<BackfaceVisibilityType>()
    
    public init (_ type: BackfaceVisibilityType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BackfaceVisibilityType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BackfaceVisibilityType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines whether or not the back face of an element should be visible when facing the user
    public static var backfaceVisibility: PropertyKey<BackfaceVisibilityType> { "backface-visibility".propertyKey() }
}

extension Stylesheet {
    /// Defines whether or not the back face of an element should be visible when facing the user
    public typealias BackfaceVisibility = BackfaceVisibilityProperty
}

extension CSSRulable {
    /// Defines whether or not the back face of an element should be visible when facing the user
    public func backfaceVisibility(_ type: BackfaceVisibilityType) -> Self {
        s?._addProperty(.backfaceVisibility, type)
        return self
    }

    /// Defines whether or not the back face of an element should be visible when facing the user
    public func backfaceVisibility(_ type: State<BackfaceVisibilityType>) -> Self {
        s?._addProperty(BackfaceVisibilityProperty(type))
        return self
    }

    /// Defines whether or not the back face of an element should be visible when facing the user
    public func backfaceVisibility<V>(_ type: ExpressableState<V, BackfaceVisibilityType>) -> Self {
        backfaceVisibility(type.unwrap())
    }
}
