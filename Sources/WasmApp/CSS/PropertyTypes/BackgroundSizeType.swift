//
//  BackgroundSizeType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackgroundSizeType: Autoable, Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Resize the background image to cover the entire container,
    /// even if it has to stretch the image or cut a little bit off one of the edges
    public static var cover: Self { .init("cover") }
    
    /// Resize the background image to make sure the image is fully visible
    public static var contain: Self { .init("contain") }
    
    public var description: String { value }
}
