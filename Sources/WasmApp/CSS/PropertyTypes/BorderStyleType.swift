//
//  BorderStyleType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BorderStyleType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The same as "none", except in border conflict resolution for table elements
    public static var hidden: Self { .init("hidden") }
    
    /// Specifies a dotted border
    public static var dotted: Self { .init("dotted") }
    
    /// Specifies a dashed border
    public static var dashed: Self { .init("dashed") }
    
    /// Specifies a solid border
    public static var solid: Self { .init("solid") }
    
    /// Specifies a double border
    public static var double: Self { .init("double") }
    
    /// Specifies a 3D grooved border. The effect depends on the border-color value
    public static var groove: Self { .init("groove") }
    
    /// Specifies a 3D ridged border. The effect depends on the border-color value
    public static var ridge: Self { .init("ridge") }
    
    /// Specifies a 3D inset border. The effect depends on the border-color value
    public static var inset: Self { .init("inset") }
    
    /// Specifies a 3D outset border. The effect depends on the border-color value
    public static var outset: Self { .init("outset") }
    
    public var description: String { value }
}
