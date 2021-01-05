//
//  BackgroundBlendModeType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BackgroundBlendModeType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This is default. Sets the blending mode to normal
    public static var normal: Self { .init("normal") }
    
    /// Sets the blending mode to multiply
    public static var multiply: Self { .init("multiply") }
    
    /// Sets the blending mode to screen
    public static var screen: Self { .init("screen") }
    
    /// Sets the blending mode to overlay
    public static var overlay: Self { .init("overlay") }
    
    /// Sets the blending mode to darken
    public static var darken: Self { .init("darken") }
    
    /// Sets the blending mode to lighten
    public static var lighten: Self { .init("lighten") }
    
    /// Sets the blending mode to color-dodge
    public static var colorDodge: Self { .init("color-dodge") }
    
    /// Sets the blending mode to saturation
    public static var saturation: Self { .init("saturation") }
    
    /// Sets the blending mode to color
    public static var color: Self { .init("color") }
    
    /// Sets the blending mode to luminosity
    public static var luminosity: Self { .init("luminosity") }
    
    public var description: String { value }
}
