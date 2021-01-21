//
//  ScrollBehavior.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies whether to smoothly animate the scroll position in a scrollable box, instead of a straight jump
///
/// ```html
/// html {
///     scroll-behavior: smooth;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_scroll-behavior.asp)
public class ScrollBehaviorProperty: _Property {
    public var propertyKey: PropertyKey<ScrollBehaviorType> { .scrollBehavior }
    public var propertyValue: ScrollBehaviorType
    var _content = _PropertyContent<ScrollBehaviorType>()
    
    public init (_ type: ScrollBehaviorType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ScrollBehaviorType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ScrollBehaviorType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether to smoothly animate the scroll position in a scrollable box, instead of a straight jump
    public static var scrollBehavior: PropertyKey<ScrollBehaviorType> { "scroll-behavior".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether to smoothly animate the scroll position in a scrollable box, instead of a straight jump
    public typealias ScrollBehavior = ScrollBehaviorProperty
}

extension CSSRulable {
    /// Specifies whether to smoothly animate the scroll position in a scrollable box, instead of a straight jump
    public func scrollBehavior(_ type: ScrollBehaviorType) -> Self {
        s?._addProperty(.scrollBehavior, type)
        return self
    }

    /// Specifies whether to smoothly animate the scroll position in a scrollable box, instead of a straight jump
    public func scrollBehavior(_ type: State<ScrollBehaviorType>) -> Self {
        s?._addProperty(ScrollBehaviorProperty(type))
        return self
    }

    /// Specifies whether to smoothly animate the scroll position in a scrollable box, instead of a straight jump
    public func scrollBehavior<V>(_ type: ExpressableState<V, ScrollBehaviorType>) -> Self {
        scrollBehavior(type.unwrap())
    }
}
