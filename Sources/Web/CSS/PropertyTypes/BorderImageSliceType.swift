//
//  BorderImageSliceType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BorderImageSliceType: Initialable, Inheritable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Causes the middle part of the image to be displayed
    public static var fill: Self { .init("fill") }
    
    /// The number(s) represent pixels for raster images or coordinates for vector images
    public static func number(_ n: NumericValue) -> Self { .init(n.numericValue) }
    
    public var description: String { value }
}
