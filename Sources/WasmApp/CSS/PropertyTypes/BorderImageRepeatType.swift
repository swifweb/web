//
//  BorderImageRepeatType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BorderImageRepeatType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The image is stretched to fill the area
    public static var stretch: Self { .init("stretch") }
    
    /// The image is tiled (repeated) to fill the area
    public static var `repeat`: Self { .init("repeat") }
    
    /// The image is tiled (repeated) to fill the area. If it does not fill the area with a whole number of tiles, the image is rescaled so it fits
    public static var round: Self { .init("round") }
    
    /// The image is tiled (repeated) to fill the area. If it does not fill the area with a whole number of tiles, the extra space is distributed around the tiles
    public static var space: Self { .init("space") }
    
    public var description: String { value }
}
