//
//  Filter.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Defines effects (e.g. blurring or color shifting) on an element before the element is displayed
///
/// ```html
/// filter: grayscale(100%);
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_filter.asp)
public class FilterProperty: _Property {
    public var propertyKey: PropertyKey<FilterType> { .filter }
    public var propertyValue: FilterType
    var _content = _PropertyContent<FilterType>()
    
    public init (_ type: FilterType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FilterType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FilterType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines effects (e.g. blurring or color shifting) on an element before the element is displayed
    public static var filter: PropertyKey<FilterType> { "filter".propertyKey() }
}

extension Stylesheet {
    /// Defines effects (e.g. blurring or color shifting) on an element before the element is displayed
    public typealias Filter = FilterProperty
}

extension CSSRulable {
    /// Defines effects (e.g. blurring or color shifting) on an element before the element is displayed
    public func filter(_ type: FilterType) -> Self {
        s?._addProperty(.filter, type)
        return self
    }

    /// Defines effects (e.g. blurring or color shifting) on an element before the element is displayed
    public func filter(_ type: State<FilterType>) -> Self {
        s?._addProperty(FilterProperty(type))
        return self
    }

    /// Defines effects (e.g. blurring or color shifting) on an element before the element is displayed
    public func filter<V>(_ type: ExpressableState<V, FilterType>) -> Self {
        filter(type.unwrap())
    }
}
