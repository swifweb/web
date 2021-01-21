//
//  ShapeType.swift
//  Web
//
//  Created by Mihael Isaev on 22.12.2020.
//

import Foundation

public final class ShapeType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Rectangular region
    public static var rect: ShapeType { .init("rect") }
    
    /// Circular region
    public static var circle: ShapeType { .init("circle") }
    
    /// Polygon
    public static var poly: ShapeType { .init("poly") }
    
    /// The entire region beyond any defined shapes
    public static var `default`: ShapeType { .init("default") }
}
