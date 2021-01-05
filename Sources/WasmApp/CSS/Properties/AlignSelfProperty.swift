//
//  AlignSelf.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the alignment for selected items inside a flexible container
///
/// ```html
/// align-self: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_align-self.asp)
public class AlignSelfProperty: _Property {
    public var propertyKey: PropertyKey<AlignSelfType> { .alignSelf }
    public var propertyValue: AlignSelfType
    var _content = _PropertyContent<AlignSelfType>()
    
    public init (_ type: AlignSelfType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var alignSelf: PropertyKey<AlignSelfType> { "align-self".propertyKey() }
}
