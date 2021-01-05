//
//  Clip.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Clips an absolutely positioned element
///
/// ```html
/// clip: rect(0px,60px,200px,0px);
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_clip.asp)
public class ClipProperty: _Property {
    public var propertyKey: PropertyKey<ClipValue> { .clip }
    public var propertyValue: ClipValue
    var _content = _PropertyContent<ClipValue>()
    
    public init (_ value: ClipValue) {
        propertyValue = value
    }
    
    public init <T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) {
        propertyValue = ClipValue(top: top, right: right, bottom: bottom, left: left)
    }
}

extension PropertyKey {
    public static var clip: PropertyKey<ClipValue> { "clip".propertyKey() }
}

public struct ClipValue: CustomStringConvertible {
    public let value: String
    
    public init <T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) {
        value = "rect(" + [top.description, right.description, bottom.description, left.description].joined(separator: ", ") + ")"
    }
    
    public var description: String { value }
}
