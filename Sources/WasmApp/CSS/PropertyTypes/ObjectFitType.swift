//
//  ObjectFitType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct ObjectFitType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This is default. The replaced content is sized to fill the element's content box.
    /// If necessary, the object will be stretched or squished to fit
    public static var fill: Self { .init("fill") }
    
    /// The replaced content is scaled to maintain its aspect ratio
    /// while fitting within the element's content box
    public static var contain: Self { .init("contain") }
    
    /// The replaced content is sized to maintain its aspect ratio
    /// while filling the element's entire content box. The object will be clipped to fit
    public static var cover: Self { .init("cover") }
    
    /// The content is sized as if none or contain
    /// were specified (would result in a smaller concrete object size)
    public static var scaleDown: Self { .init("scale-down") }
    
    public var description: String { value }
}
