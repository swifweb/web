//
//  BackgroundSizeProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the size of the background images
///
/// ```html
/// background-size: 300px 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-size.asp)
public class BackgroundSizeProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundSizeValue> { .backgroundSize }
    public var propertyValue: BackgroundSizeValue
    var _content = _PropertyContent<BackgroundSizeValue>()
    
    public init (_ value: BackgroundSizeValue) {
        propertyValue = value
    }
    
    public init (all: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(all: all)
    }
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(h: h, v: v)
    }
}

extension PropertyKey {
    public static var backgroundSize: PropertyKey<BackgroundSizeValue> { "background-size".propertyKey() }
}

public struct BackgroundSizeValue: CustomStringConvertible {
    public let value: String
    
    public init (all: BackgroundSizeType) {
        value = all.value
    }
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        value = [h.value, v.value].joined(separator: " ")
    }
    
    public var description: String { value }
}
