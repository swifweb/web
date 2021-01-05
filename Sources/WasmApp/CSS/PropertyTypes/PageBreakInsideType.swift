//
//  PageBreakInsideType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct PageBreakInsideType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Avoid page-break inside the element (if possible)
    public static var avoid: Self { .init("avoid") }
    
    public var description: String { value }
}
