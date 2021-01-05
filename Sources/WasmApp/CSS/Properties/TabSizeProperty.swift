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
/// [Learn more](___)
public class TabSizeProperty: _Property {
    public var propertyKey: PropertyKey<TabSizeType> { .tabSize }
    public var propertyValue: TabSizeType
    var _content = _PropertyContent<TabSizeType>()
    
    public init (_ type: TabSizeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var tabSize: PropertyKey<TabSizeType> { "tab-size".propertyKey() }
}
