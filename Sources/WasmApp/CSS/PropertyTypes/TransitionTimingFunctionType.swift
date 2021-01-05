//
//  TransitionTimingFunctionType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TransitionTimingFunctionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Specifies a transition effect with a slow start, then fast, then end slowly (equivalent to cubic-bezier(0.25,0.1,0.25,1))
    public static var ease: Self { .init("ease") }
    
    /// Specifies a transition effect with the same speed from start to end (equivalent to cubic-bezier(0,0,1,1))
    public static var linear: Self { .init("linear") }
    
    /// Specifies a transition effect with a slow start (equivalent to cubic-bezier(0.42,0,1,1))
    public static var easeIn: Self { .init("ease-in") }
    
    /// Specifies a transition effect with a slow end (equivalent to cubic-bezier(0,0,0.58,1))
    public static var easeOut: Self { .init("ease-out") }
    
    /// Specifies a transition effect with a slow start and end (equivalent to cubic-bezier(0.42,0,0.58,1))
    public static var easeInOut: Self { .init("ease-in-out") }
    
    /// Equivalent to steps(1, start)
    public static var stepStart: Self { .init("step-start") }
    
    /// Equivalent to steps(1, end)
    public static var stepEnd: Self { .init("step-end") }
    
    /// Specifies a stepping function, with two parameters.
    /// The first parameter specifies the number of intervals in the function.
    /// It must be a positive integer (greater than 0).
    /// The second parameter, which is optional, is either the value "start" or "end",
    /// and specifies the point at which the change of values occur within the interval.
    /// If the second parameter is omitted, it is given the value "end"
    public static func steps(_ v: Int, _ type: StepsType) -> Self { .init("steps(\(v), \(type.rawValue))") }
    
    /// Define your own values in the cubic-bezier function. Possible values are numeric values from 0 to 1
    public static func cubicBezier(_ a: Double, _ b: Double, _ c: Double, _ d: Double) -> Self { .init("cubic-bezier(\(a), \(b), \(c), \(d))") }
    
    public var description: String { value }
}
