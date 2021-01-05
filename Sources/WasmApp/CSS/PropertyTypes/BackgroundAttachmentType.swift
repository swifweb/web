//
//  BackgroundAttachmentType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackgroundAttachmentType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The background image will scroll with the page. This is default
    public static var scroll: Self { .init("scroll") }
    
    /// The background image will not scroll with the page
    public static var fixed: Self { .init("fixed") }
    
    /// The background image will scroll with the element's contents
    public static var local: Self { .init("local") }
    
    public var description: String { value }
}
