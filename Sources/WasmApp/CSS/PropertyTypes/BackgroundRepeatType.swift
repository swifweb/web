//
//  BackgroundRepeatType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackgroundRepeatType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The background image is repeated both vertically and horizontally.
    /// The last image will be clipped if it does not fit.
    /// This is default
    public static var `repeat`: Self { .init("repeat") }
    
    /// The background image is repeated only horizontally
    public static var repeatX: Self { .init("repeat-x") }
    
    /// The background image is repeated only vertically
    public static var repeatY: Self { .init("repeat-y") }
    
    /// The background-image is not repeated. The image will only be shown once
    public static var noRepeat: Self { .init("no-repeat") }
    
    /// The background-image is repeated as much as possible without clipping.
    /// The first and last images are pinned to either side of the element,
    /// and whitespace is distributed evenly between the images
    public static var space: Self { .init("space") }
    
    /// The background-image is repeated and squished or stretched to fill the space (no gaps)
    public static var round: Self { .init("round") }
    
    public var description: String { value }
}
