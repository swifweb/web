//
//  PositionType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct PositionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Elements render in order, as they appear in the document flow
    public static var `static`: Self { .init("static") }
    
    /// The element is positioned relative to its first positioned (not static) ancestor element
    public static var absolute: Self { .init("absolute") }
    
    /// The element is positioned relative to the browser window
    public static var fixed: Self { .init("fixed") }
    
    /// The element is positioned relative to its normal position,
    /// so "left:20px" adds 20 pixels to the element's LEFT position
    public static var relative: Self { .init("relative") }
    
    /// The element is positioned based on the user's scroll position
    /// A sticky element toggles between relative and fixed, depending on the scroll position.
    /// It is positioned relative until a given offset position
    /// is met in the viewport - then it "sticks" in place (like position:fixed).
    ///
    /// Note: Not supported in IE/Edge 15 or earlier.
    /// Supported in Safari from version 6.1 with a -webkit- prefix.
    public static var sticky: Self { .init("sticky") }
    
    public var description: String { value }
}
