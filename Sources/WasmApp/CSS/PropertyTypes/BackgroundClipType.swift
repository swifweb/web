//
//  BackgroundClipType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackgroundClipType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value.
    /// The background extends behind the border
    public static var borderBox: Self { .init("border-box") }
    
    /// The background extends to the inside edge of the border
    public static var paddingBox: Self { .init("padding-box") }
    
    /// The background extends to the edge of the content box
    public static var contentBox: Self { .init("content-box") }
    
    public var description: String { value }
}
