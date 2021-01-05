//
//  BreakType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BreakType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Always insert a page-break right before the principal box
    public static var all: Self { .init("all") }
    
    /// Always insert a page-break before the element
    public static var always: Self { .init("always") }
    
    /// Avoid a page/column/region break before the element
    public static var avoid: Self { .init("avoid") }
    
    /// Avoid a column-break before the element
    public static var avoidColumn: Self { .init("avoid-column") }
    
    /// Avoid a page-break before the element
    public static var avoidPage: Self { .init("avoid-page") }
    
    /// Avoid a region-break before the element
    public static var avoidRegion: Self { .init("avoid-region") }
    
    /// Always insert a column-break before the element
    public static var column: Self { .init("column") }
    
    /// Insert one or two page-breaks before the element so that the next page is formatted as a left page
    public static var left: Self { .init("left") }
    
    /// Always insert a page-break before the element
    public static var page: Self { .init("page") }
    
    /// Insert one or two page-breaks before the principal box so that the next page is formatted as a recto page
    public static var recto: Self { .init("recto") }
    
    /// Always insert a region-break before the element
    public static var region: Self { .init("region") }
    
    /// Insert one or two page-breaks before the element so that the next page is formatted as a right page
    public static var right: Self { .init("right") }
    
    /// Insert one or two page-breaks before the principal box so that the next page is formatted as a verso page
    public static var verso: Self { .init("verso") }
    
    public var description: String { value }
}
