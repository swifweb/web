//
//  CSSFunction.swift
//  Web
//
//  Created by Mihael Isaev on 17.02.2021.
//

import Foundation

public final class CSSFunction: CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
    
    // MARK: Linear Gradient
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
    public static func linearGradient(_ colors: Color...) -> CSSFunction {
        .linearGradient(colors)
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
    public static func linearGradient(_ colors: [Color]) -> CSSFunction {
        .linearGradient(nil, colors.map { $0.description })
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
    public static func linearGradient<A: AngleValue>(_ angle: A, _ colors: Color...) -> CSSFunction {
        .linearGradient(angle, colors)
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
    public static func linearGradient<A: AngleValue>(_ angle: A, _ colors: [Color]) -> CSSFunction {
        .linearGradient(angle, colors.map { $0.description })
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
    static func linearGradient(_ angle: AngleValue? = nil, _ colors: [String]) -> CSSFunction {
        var result = "linear-gradient("
        if let angle = angle {
            result += "\(angle.angleValue), "
        }
        if colors.count > 0 {
            result += colors.joined(separator: ", ")
        }
        result += ")"
        return .init(result)
    }
    
    // MARK: Radial Gradient
    
    /// The radial-gradient() CSS function creates an image consisting
    /// of a progressive transition between two or more colors that radiate from an origin.
    /// Its shape may be a circle or an ellipse.
    /// The function's result is an object of the `<gradient>` data type, which is a special kind of `<image>`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/radial-gradient())
    public static func radialGradient(
        _ shape: CSSRadialGradientShape = .ellipse,
        _ size: CSSRadialGradientSize = .farthestCorner,
        _ position: NumericValue,
        _ colors: Color...
    ) -> CSSFunction {
        radialGradient(shape, size, .percent(position), colors)
    }
    
    /// The radial-gradient() CSS function creates an image consisting
    /// of a progressive transition between two or more colors that radiate from an origin.
    /// Its shape may be a circle or an ellipse.
    /// The function's result is an object of the `<gradient>` data type, which is a special kind of `<image>`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/radial-gradient())
    public static func radialGradient(
        _ shape: CSSRadialGradientShape = .ellipse,
        _ size: CSSRadialGradientSize = .farthestCorner,
        _ position: NumericValue,
        _ colors: [Color]
    ) -> CSSFunction {
        radialGradient(shape, size, .percent(position), colors)
    }
    
    /// The radial-gradient() CSS function creates an image consisting
    /// of a progressive transition between two or more colors that radiate from an origin.
    /// Its shape may be a circle or an ellipse.
    /// The function's result is an object of the `<gradient>` data type, which is a special kind of `<image>`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/radial-gradient())
    public static func radialGradient(
        _ shape: CSSRadialGradientShape = .ellipse,
        _ size: CSSRadialGradientSize = .farthestCorner,
        _ position: CSSRadialGradientPosition = .center,
        _ colors: Color...
    ) -> CSSFunction {
        radialGradient(shape, size, position, colors)
    }
    
    /// The radial-gradient() CSS function creates an image consisting
    /// of a progressive transition between two or more colors that radiate from an origin.
    /// Its shape may be a circle or an ellipse.
    /// The function's result is an object of the `<gradient>` data type, which is a special kind of `<image>`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/radial-gradient())
    public static func radialGradient(
        _ shape: CSSRadialGradientShape = .ellipse,
        _ size: CSSRadialGradientSize = .farthestCorner,
        _ position: CSSRadialGradientPosition = .center,
        _ colors: [Color]
    ) -> CSSFunction {
        var result = "radial-gradient(\(shape.rawValue) \(size.rawValue) at \(position.value), "
        if colors.count > 0 {
            result += colors.map { $0.description }.joined(separator: ", ")
        }
        result += ")"
        return .init(result)
    }
}

/// The shape of the gradient.
public enum CSSRadialGradientShape: String {
    /// Default
    case ellipse
    case circle
}

/// The size of the gradient.
public enum CSSRadialGradientSize: String {
    /// The default value, the gradient's ending shape is sized so that it exactly
    /// meets the farthest corner of the box from its center.
    case farthestCorner = "farthest-corner"
    
    /// The gradient's ending shape meets the side of the box closest to its center (for circles)
    /// or meets both the vertical and horizontal sides closest to the center (for ellipses).
    case closestSide = "closest-side"
    
    /// The gradient's ending shape is sized so that it exactly meets the closest corner of the box from its center.
    case closestCorner = "closest-corner"
    
    /// Similar to closest-side, except the ending shape is sized
    /// to meet the side of the box farthest from its center (or vertical and horizontal sides).
    case farthestSide = "farthest-side"
}

public struct CSSRadialGradientPosition: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var center: Self { .init("center") }
    
    public static var top: Self { .init("top") }
    
    public static var bottom: Self { .init("bottom") }
    
    public static var left: Self { .init("left") }
    
    public static var right: Self { .init("right") }
    
    public static func percent(_ v: NumericValue) -> Self { .init(v.numericValue + "%") }
    
    public var description: String { value }
}
