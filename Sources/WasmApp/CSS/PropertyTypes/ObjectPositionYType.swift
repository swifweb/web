//
//  ObjectPositionYType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct ObjectPositionYType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var top: Self { .init("top") }
    public static var center: Self { .init("center") }
    public static var bottom: Self { .init("bottom") }
    
    public var description: String { value }
}
