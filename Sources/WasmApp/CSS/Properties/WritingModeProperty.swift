//
//  WritingMode.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies whether lines of text are laid out horizontally or vertically
///
/// ```html
/// p.test1 {
///     writing-mode: horizontal-tb;
/// }
///
/// p.test2 {
///     writing-mode: vertical-rl;
/// }
///
/// span.test2 {
///     writing-mode: vertical-rl;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_writing-mode.asp)
public class WritingModeProperty: _Property {
    public var propertyKey: PropertyKey<WritingModeType> { .writingMode }
    public var propertyValue: WritingModeType
    var _content = _PropertyContent<WritingModeType>()
    
    public init (_ type: WritingModeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var writingMode: PropertyKey<WritingModeType> { "writing-mode".propertyKey() }
}
