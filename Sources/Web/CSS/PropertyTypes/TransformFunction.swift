//
//  TransformFunction.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TransformFunction: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines that there should be no transformation
    public static var none: TransformFunction{ .init("") }
    
    /// Defines a 2D transformation, using a matrix of six values
    public static func matrix(_ a: Double, _ b: Double, _ c: Double, _ d: Double, _ e: Double, _ f: Double) -> TransformFunction {
        .init("matrix(" + [a, b, c, d, e, f].map { "\($0)" }.joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D transformation, using a 4x4 matrix of 16 values
    public static func matrix3d(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double, g: Double, h: Double, i: Double, j: Double, k: Double, l: Double, m: Double, n: Double, o: Double, p: Double) -> TransformFunction {
        .init("matrix3d(" + [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p].map { "\($0)" }.joined(separator: ", ") + ")")
    }
    
    /// Defines a 2D translation
    public static func translate<X: UnitValuable, Y: UnitValuable>(_ x: X, _ y: Y) -> TransformFunction {
        .init("translate(" + [x.description, y.description].joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D translation
    public static func translate3d<X: UnitValuable, Y: UnitValuable, Z: UnitValuable>(_ x: X, _ y: Y, _ z: Z) -> TransformFunction {
        .init("translate3d(" + [x.description, y.description, z.description].joined(separator: ", ") + ")")
    }
    
    /// Defines a translation, using only the value for the X-axis
    public static func translateX<X: UnitValuable>(_ x: X) -> TransformFunction {
        .init("translateX(" + x.description + ")")
    }
    
    /// Defines a translation, using only the value for the Y-axis
    public static func translateY<Y: UnitValuable>(_ y: Y) -> TransformFunction {
        .init("translateY(" + y.description + ")")
    }
    
    /// Defines a 3D translation, using only the value for the Z-axis
    public static func translateZ<Z: UnitValuable>(_ z: Z) -> TransformFunction {
        .init("translateZ(" + z.description + ")")
    }
    
    /// Defines a 2D scale transformation
    public static func scale(_ x: NumericValue, _ y: NumericValue) -> TransformFunction {
        .init("scale(" + [x.numericValue, y.numericValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D scale transformation
    public static func scale3d(_ x: NumericValue, _ y: NumericValue, _ z: NumericValue) -> TransformFunction {
        .init("scale3d(" + [x.numericValue, y.numericValue, z.numericValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a scale transformation by giving a value for the X-axis
    public static func scaleX(_ x: NumericValue) -> TransformFunction {
        .init("scaleX(" + x.numericValue + ")")
    }
    
    /// Defines a scale transformation by giving a value for the Y-axis
    public static func scaleY(_ y: NumericValue) -> TransformFunction {
        .init("scaleY(" + y.numericValue + ")")
    }
    
    /// Defines a 3D scale transformation by giving a value for the Z-axis
    public static func scaleZ(_ z: NumericValue) -> TransformFunction {
        .init("scaleZ(" + z.numericValue + ")")
    }
    
    /// Defines a 2D rotation, the angle is specified in the parameter
    public static func rotate(_ angle: AngleValue) -> TransformFunction {
        .init("rotate(" + angle.angleValue + ")")
    }
    
    /// Defines a 3D rotation
    public static func rotate3d(_ x: NumericValue, _ y: NumericValue, _ z: NumericValue, _ angle: AngleValue) -> TransformFunction {
        .init("rotate3d(" + [x.numericValue, y.numericValue, z.numericValue, angle.angleValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D rotation along the X-axis
    public static func rotateX(_ angle: AngleValue) -> TransformFunction {
        .init("rotateX(" + angle.angleValue + ")")
    }
    
    /// Defines a 3D rotation along the Y-axis
    public static func rotateY(_ angle: AngleValue) -> TransformFunction {
        .init("rotateY(" + angle.angleValue + ")")
    }
    
    /// Defines a 3D rotation along the Z-axis
    public static func rotateZ(_ angle: AngleValue) -> TransformFunction {
        .init("rotateZ(" + angle.angleValue + ")")
    }
    
    /// Defines a 2D skew transformation along the X- and the Y-axis
    public static func skew(_ xAngle: AngleValue, yAngle: AngleValue) -> TransformFunction {
        .init("skew(" + [xAngle.angleValue, yAngle.angleValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a 2D skew transformation along the X-axis
    public static func skewX(_ angle: AngleValue) -> TransformFunction {
        .init("skewX(" + angle.angleValue + ")")
    }
    
    /// Defines a 2D skew transformation along the Y-axis
    public static func skewY(_ angle: AngleValue) -> TransformFunction {
        .init("skewY(" + angle.angleValue + ")")
    }
    
    /// Defines a perspective view for a 3D transformed element
    public static func perspective<V: UnitValuable>(_ n: V) -> TransformFunction {
        .init("perspective(" + n.description + ")")
    }
    
    public var description: String { value }
}
