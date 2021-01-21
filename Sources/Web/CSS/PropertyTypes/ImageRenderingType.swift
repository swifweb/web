//
//  ImageRenderingType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct ImageRenderingType: Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The image must be scaled with an algorithm that preserves contrast
    /// and edges in the image, and which does not smooth colors or introduce
    /// blur to the image in the process. Suitable algorithms include nearest-neighbor
    /// and other non-smoothing scaling algorithms such as 2×SaI and hqx-family algorithms.
    /// This value is intended for pixel-art images, such as in browser games.
    public static var crispEdges: Self { .init("crisp-edges") }
    
    /// When scaling the image up, the nearest-neighbor algorithm must be used,
    /// so that the image appears to be composed of large pixels.
    /// When scaling down, this is the same as auto.
    public static var pixelated: Self { .init("pixelated") }
    
    public var description: String { value }
}
