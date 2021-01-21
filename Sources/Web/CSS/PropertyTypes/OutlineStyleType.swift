//
//  OutlineStyleType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct OutlineStyleType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a hidden outline
    public static var hidden: Self { .init("hidden") }
    
    /// Specifies a dotted outline
    public static var dotted: Self { .init("dotted") }
    
    /// Specifies a dashed outline
    public static var dashed: Self { .init("dashed") }
    
    /// Specifies a solid outline
    public static var solid: Self { .init("solid") }
    
    /// Specifies a double outliner
    public static var double: Self { .init("double") }
    
    /// Specifies a 3D grooved outline. The effect depends on the outline-color value
    public static var groove: Self { .init("groove") }
    
    /// Specifies a 3D ridged outline. The effect depends on the outline-color value
    public static var ridge: Self { .init("ridge") }
    
    /// Specifies a 3D inset outline. The effect depends on the outline-color value
    public static var inset: Self { .init("inset") }
    
    /// Specifies a 3D outset outline. The effect depends on the outline-color value
    public static var outset: Self { .init("outset") }
    
    public var description: String { value }
}
