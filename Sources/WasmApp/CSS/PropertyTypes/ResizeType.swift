//
//  ResizeType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct ResizeType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The user can resize both the height and width of the element
    public static var both: Self { .init("both") }
    
    /// The user can resize the width of the element
    public static var horizontal: Self { .init("horizontal") }
    
    /// The user can resize the height of the element
    public static var vertical: Self { .init("vertical") }
    
    public var description: String { value }
}
