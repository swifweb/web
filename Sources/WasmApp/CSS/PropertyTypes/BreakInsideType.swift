//
//  BreakInsideType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BreakInsideType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Avoid a page/column/region break inside the element
    public static var avoid: Self { .init("avoid") }
    
    /// Avoid a column-break inside the element
    public static var avoidColumn: Self { .init("avoid-column") }
    
    /// Avoid a page-break inside the element
    public static var avoidPage: Self { .init("avoid-page") }
    
    /// Avoid a region-break inside the element
    public static var avoidRegion: Self { .init("avoid-region") }
    
    public var description: String { value }
}
