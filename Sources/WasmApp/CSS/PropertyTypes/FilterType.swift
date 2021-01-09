//
//  FilterType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct FilterType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Applies a blur effect to the image. A larger value will create more blur.
    ///
    /// If no value is specified, 0 is used.
    public static func blur(_ px: NumericValue) -> Self { .init("blur(\(px)px") }
    
    /// Adjusts the brightness of the image.
    ///
    /// 0% will make the image completely black.
    /// 100% (1) is default and represents the original image.
    /// Values over 100% will provide brighter results.
    public static func brightness(_ p: NumericValue) -> Self { .init("brightness(\(p)%)") }
    
    /// Adjusts the contrast of the image.
    ///
    /// 0% will make the image completely black.
    /// 100% (1) is default, and represents the original image.
    /// Values over 100% will provide results with more contrast.
    public static func contrast(_ p: NumericValue) -> Self { .init("contrast(\(p)%)") }
    
    /// Applies a drop shadow effect to the image.
    ///
    /// Possible values:
    /// h-shadow - Required. Specifies a pixel value for the horizontal shadow. Negative values place the shadow to the left of the image.
    ///
    /// v-shadow - Required. Specifies a pixel value for the vertical shadow. Negative values place the shadow above the image.
    ///
    /// blur - Optional. This is the third value, and must be in pixels. Adds a blur effect to the shadow. A larger value will create more blur (the shadow becomes bigger and lighter). Negative values are not allowed. If no value is specified, 0 is used (the shadow's edge is sharp).
    ///
    /// spread - Optional. This is the fourth value, and must be in pixels. Positive values will cause the shadow to expand and grow bigger, and negative values will cause the shadow to shrink. If not specified, it will be 0 (the shadow will be the same size as the element).
    /// Note: Chrome, Safari and Opera, and maybe other browsers, do not support this 4th length; it will not render if added.
    ///
    /// color - Optional. Adds a color to the shadow. If not specified, the color depends on the browser (often black).
    ///
    /// An example of creating a red shadow, which is 8px big both horizontally and vertically, with a blur effect of 10px:
    ///
    /// filter: drop-shadow(8px 8px 10px red);
    ///
    /// Tip: This filter is similar to the box-shadow property.
    public static func dropShadow<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: ColorType? = nil) -> Self {
        var elements: [String] = [h.description, v.description]
        if let blur = blur {
            elements.append(blur.numericValue)
        }
        if let spread = spread {
            elements.append(spread.numericValue)
        }
        if let color = color {
            elements.append(color.description)
        }
        return .init("drop-shadow(\(elements.joined(separator: " "))")
    }
    
    /// Converts the image to grayscale.
    ///
    /// 0% (0) is default and represents the original image.
    /// 100% will make the image completely gray (used for black and white images).
    ///
    /// Note: Negative values are not allowed.
    public static func grayscale(_ p: NumericValue) -> Self { .init("grayscale(\(p)%)") }
    
    /// Applies a hue rotation on the image. The value defines the number of degrees around the color circle the image samples will be adjusted. 0deg is default, and represents the original image.
    ///
    /// Note: Maximum value is 360deg.
    public static func hueRotate(_ deg: AngleValue) -> Self { .init("hue-rotate(\(deg.angleValue)") }
    
    /// Inverts the samples in the image.
    ///
    /// 0% (0) is default and represents the original image.
    /// 100% will make the image completely inverted.
    ///
    /// Note: Negative values are not allowed.
    public static func invert(_ p: NumericValue) -> Self { .init("invert(\(p)%)") }
    
    /// Sets the opacity level for the image. The opacity-level describes the transparency-level, where:
    ///
    /// 0% is completely transparent.
    /// 100% (1) is default and represents the original image (no transparency).
    ///
    /// Note: Negative values are not allowed.
    /// Tip: This filter is similar to the opacity property.
    public static func opacity(_ p: NumericValue) -> Self { .init("opacity(\(p)%)") }
    
    /// Saturates the image.
    ///
    /// 0% (0) will make the image completely un-saturated.
    /// 100% is default and represents the original image.
    /// Values over 100% provides super-saturated results.
    ///
    /// Note: Negative values are not allowed.
    public static func saturate(_ p: NumericValue) -> Self { .init("saturate(\(p)%)") }
    
    /// Converts the image to sepia.
    ///
    /// 0% (0) is default and represents the original image.
    /// 100% will make the image completely sepia.
    ///
    /// Note: Negative values are not allowed.
    public static func sepia(_ p: NumericValue) -> Self { .init("sepia(\(p)%") }
    
    /// The url() function takes the location of an XML file that specifies an SVG filter, and may include an anchor to a specific filter element. Example:
    ///
    /// filter: url(svg-url#element-id)
    public static func url(_ v: String) -> Self { .init("url(svg-url\(v)") }
    
    public var description: String { value }
}
