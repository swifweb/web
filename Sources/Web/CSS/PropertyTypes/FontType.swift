//
//  FontType.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

public struct FontType: Initialable, Inheritable {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Uses the font that are used by captioned controls (like buttons, drop-downs, etc.)
    public static var caption: Self { .init("caption") }
    
    /// Uses the font that are used by icon labels
    public static var icon: Self { .init("icon") }
    
    /// Uses the fonts that are used by dropdown menus
    public static var menu: Self { .init("menu") }
    
    /// Uses the fonts that are used by dialog boxes
    public static var messageBox: Self { .init("message-box") }
    
    /// A smaller version of the caption font
    public static var smallCaption: Self { .init("small-caption") }
    
    /// Uses the fonts that are used by the status bar
    public static var statusBar: Self { .init("status-bar") }
}
