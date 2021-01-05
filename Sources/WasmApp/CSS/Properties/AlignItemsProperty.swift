//
//  AlignItems.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the alignment for items inside a flexible container
///
/// ```html
/// align-items: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_align-items.asp)
public class AlignItemsProperty: _Property {
    public var propertyKey: PropertyKey<AlignItemsType> { .alignItems }
    public var propertyValue: AlignItemsType
    var _content = _PropertyContent<AlignItemsType>()
    
    public init (_ type: AlignItemsType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var alignItems: PropertyKey<AlignItemsType> { "align-items".propertyKey() }
}
