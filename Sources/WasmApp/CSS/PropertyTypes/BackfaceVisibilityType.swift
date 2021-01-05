//
//  BackfaceVisibilityType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackfaceVisibilityType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The backside is visible
    public static var visible: Self { .init("visible") }
    
    /// The backside is not visible
    public static var hidden: Self { .init("hidden") }
    
    public var description: String { value }
}
