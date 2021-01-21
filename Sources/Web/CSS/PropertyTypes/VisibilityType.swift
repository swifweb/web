//
//  VisibilityType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct VisibilityType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The element is visible
    public static var visible: Self { .init("visible") }
    
    /// The element is hidden (but still takes up space)
    public static var hidden: Self { .init("hidden") }
    
    /// Only for table rows (`<tr>`), row groups (`<tbody>`), columns (`<col>`), column groups (`<colgroup>`).
    /// This value removes a row or column, but it does not affect the table layout.
    /// The space taken up by the row or column will be available for other content.
    /// If collapse is used on other elements, it renders as "hidden"
    public static var collapse: Self { .init("collapse") }
    
    public var description: String { value }
}
