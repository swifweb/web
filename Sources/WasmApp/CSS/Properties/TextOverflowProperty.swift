//
//  TextOverflow.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies what should happen when text overflows the containing element
///
/// ```html
/// div {
///     white-space: nowrap;
///     overflow: hidden;
///     text-overflow: ellipsis;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-overflow.asp)
public class TextOverflowProperty: _Property {
    public var propertyKey: PropertyKey<TextOverflowType> { .textOverflow }
    public var propertyValue: TextOverflowType
    var _content = _PropertyContent<TextOverflowType>()
    
    public init (_ type: TextOverflowType) {
        propertyValue = type
    }
    
    //    public convenience init (_ type: State<TextOverflowType>) {
    //        self.init(type.wrappedValue)
    //        type.listen { self._changed(to: $0) }
    //    }
    //
    //    public convenience init <V>(_ type: ExpressableState<V, TextOverflowType>) {
    //        self.init(type.unwrap())
    //    }
}

extension PropertyKey {
    /// Specifies what should happen when text overflows the containing element
    public static var textOverflow: PropertyKey<TextOverflowType> { "text-overflow".propertyKey() }
}

extension Stylesheet {
    /// Specifies what should happen when text overflows the containing element
    public typealias TextOverflow = TextOverflowProperty
}

extension CSSRulable {
    /// Specifies what should happen when text overflows the containing element
    public func textOverflow(_ type: TextOverflowType) -> Self {
        s?._addProperty(.textOverflow, type)
        return self
    }

    /// Specifies what should happen when text overflows the containing element
    public func textOverflow(_ type: State<TextOverflowType>) -> Self {
        s?._addProperty(TextOverflowProperty(type))
        return self
    }

    /// Specifies what should happen when text overflows the containing element
    public func textOverflow<V>(_ type: ExpressableState<V, TextOverflowType>) -> Self {
        textOverflow(type.unwrap())
    }
}
