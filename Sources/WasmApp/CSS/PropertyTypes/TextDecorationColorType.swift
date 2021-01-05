//
//  TextDecorationColorType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextDecorationColorType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies the color of the text-decoration
    public static func color(_ color: ColorType) -> Self { .init(color.description) }
    
    public var description: String { value }
}
