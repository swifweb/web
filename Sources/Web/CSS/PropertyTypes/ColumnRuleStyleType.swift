//
//  ColumnRuleStyleType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct ColumnRuleStyleType: Initialable, Inheritable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines a hidden rule
    public static var hidden: Self { .init("hidden") }
    
    /// Defines a dotted rule
    public static var dotted: Self { .init("dotted") }
    
    /// Defines a dashed rule
    public static var dashed: Self { .init("dashed") }
    
    /// Defines a solid rule
    public static var solid: Self { .init("solid") }
    
    /// Defines a double rule
    public static var double: Self { .init("double") }
    
    /// Specifies a 3D grooved rule. The effect depends on the width and color values
    public static var groove: Self { .init("groove") }
    
    /// Specifies a 3D ridged rule. The effect depends on the width and color values
    public static var ridge: Self { .init("ridge") }
    
    /// Specifies a 3D inset rule. The effect depends on the width and color values
    public static var inset: Self { .init("inset") }
    
    /// Specifies a 3D outset rule. The effect depends on the width and color values
    public static var outset: Self { .init("outset") }
    
    public var description: String { value }
}
