//
//  BoxSizing.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Defines how the width and height of an element are calculated: should they include padding and borders, or not
///
/// ```html
/// box-sizing: border-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_box-sizing.asp)
public class BoxSizingProperty: _Property {
    public var propertyKey: PropertyKey<BoxSizingType> { .boxSizing }
    public var propertyValue: BoxSizingType
    var _content = _PropertyContent<BoxSizingType>()
    
    public init (_ type: BoxSizingType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BoxSizingType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BoxSizingType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines how the width and height of an element are calculated: should they include padding and borders, or not
    public static var boxSizing: PropertyKey<BoxSizingType> { "box-sizing".propertyKey() }
}

extension Stylesheet {
    /// Defines how the width and height of an element are calculated: should they include padding and borders, or not
    public typealias BoxSizing = BoxSizingProperty
}

extension CSSRulable {
    /// Defines how the width and height of an element are calculated: should they include padding and borders, or not
    public func boxSizing(_ type: BoxSizingType) -> Self {
        s?._addProperty(.boxSizing, type)
        return self
    }

    /// Defines how the width and height of an element are calculated: should they include padding and borders, or not
    public func boxSizing(_ type: State<BoxSizingType>) -> Self {
        s?._addProperty(BoxSizingProperty(type))
        return self
    }

    /// Defines how the width and height of an element are calculated: should they include padding and borders, or not
    public func boxSizing<V>(_ type: ExpressableState<V, BoxSizingType>) -> Self {
        boxSizing(type.unwrap())
    }
}
