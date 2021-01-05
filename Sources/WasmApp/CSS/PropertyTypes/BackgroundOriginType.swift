//
//  BackgroundOriginType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackgroundOriginType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value.
    /// The background image starts from the upper left corner of the padding edge
    public static var paddingBox: Self { .init("padding-box") }
    
    /// The background image starts from the upper left corner of the border
    public static var borderBox: Self { .init("border-box") }
    
    /// The background image starts from the upper left corner of the content
    public static var contentBox: Self { .init("content-box") }
    
    public var description: String { value }
}
