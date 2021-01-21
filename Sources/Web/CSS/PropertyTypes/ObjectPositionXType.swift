//
//  ObjectPositionXType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct ObjectPositionXType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var left: Self { .init("left") }
    public static var center: Self { .init("center") }
    public static var right: Self { .init("right") }
    
    public var description: String { value }
}
