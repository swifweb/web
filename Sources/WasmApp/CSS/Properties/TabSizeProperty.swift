//
//  TabSize.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the width of a tab character
///
/// ```html
/// /* <integer> values */
/// tab-size: 4;
/// tab-size: 0;
///
/// /* <length> values */
/// tab-size: 10px;
/// tab-size: 2em;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/tab-size)
public class TabSizeProperty: _Property {
    public var propertyKey: PropertyKey<TabSizeType> { .tabSize }
    public var propertyValue: TabSizeType
    var _content = _PropertyContent<TabSizeType>()
    
    public init (_ type: TabSizeType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TabSizeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TabSizeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the width of a tab character
    public static var tabSize: PropertyKey<TabSizeType> { "tab-size".propertyKey() }
}

extension Stylesheet {
    /// Specifies the width of a tab character
    public typealias TabSize = TabSizeProperty
}

extension CSSRulable {
    /// Specifies the width of a tab character
    public func tabSize(_ type: TabSizeType) -> Self {
        s?._addProperty(.tabSize, type)
        return self
    }

    /// Specifies the width of a tab character/// Specifies the width of a tab character
    public func tabSize(_ type: State<TabSizeType>) -> Self {
        s?._addProperty(TabSizeProperty(type))
        return self
    }

    /// Specifies the width of a tab character
    public func tabSize<V>(_ type: ExpressableState<V, TabSizeType>) -> Self {
        tabSize(type.unwrap())
    }
}
