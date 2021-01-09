//
//  TextShadowType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextShadowType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static func value<H: UnitValuable, V: UnitValuable, B: UnitValuable>(_ hShadow: H, _ vShadow: V, _ blurRadius: B, _ color: ColorType) -> TextShadowType {
        .init(buildValue(h: hShadow.description, v: vShadow.description, blur: blurRadius.description, color: color.description))
    }
    
    static func buildValue(h: String, v: String, blur: String, color: String) -> String {
        [h, v, blur, color].joined(separator: " ")
    }
    
    public var description: String { value }
}
