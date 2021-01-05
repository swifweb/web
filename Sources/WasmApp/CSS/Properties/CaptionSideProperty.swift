//
//  CaptionSide.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the placement of a table caption
///
/// ```html
/// caption-side: bottom;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_tab_caption-side.asp)
public class CaptionSideProperty: _Property {
    public var propertyKey: PropertyKey<CaptionSideType> { .captionSide }
    public var propertyValue: CaptionSideType
    var _content = _PropertyContent<CaptionSideType>()
    
    public init (_ type: CaptionSideType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var captionSide: PropertyKey<CaptionSideType> { "caption-side".propertyKey() }
}
