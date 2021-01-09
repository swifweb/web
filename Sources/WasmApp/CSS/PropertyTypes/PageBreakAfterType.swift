//
//  PageBreakAfterType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct PageBreakAfterType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Always insert a page-break after the element
    public static var always: Self { .init("always") }
    
    /// Avoid page-break after the element (if possible)
    public static var avoid: Self { .init("avoid") }
    
    /// Insert page-break after the element so that the next page is formatted as a left page
    public static var left: Self { .init("left") }
    
    /// Insert page-break after the element so that the next page is formatted as a right page
    public static var right: Self { .init("right") }
    
    public var description: String { value }
}
