//
//  BackgroundPositionType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackgroundPositionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var center: Self { .init("center") }
    
    public static func axis(h: XAxis, v: YAxis) -> Self { .init([h.value, v.value].joined(separator: " ")) }
        
    public static func percent(h: NumericValue, v: NumericValue) -> Self { .init([h.numericValue, v.numericValue].joined(separator: " ")) }
    
    public static func position<H: UnitValuable, V: UnitValuable>(h: H, v: V) -> Self { .init([h.description, v.description].joined(separator: " ")) }
    
    public var description: String { value }
}
