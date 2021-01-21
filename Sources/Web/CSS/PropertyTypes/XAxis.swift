//
//  XAxis.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines where the view is placed at the x-axis.
public struct XAxis: Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var left: XAxis { .init("left") }
    public static var center: XAxis { .init("center") }
    public static var right: XAxis { .init("right") }
    
    public var description: String { value }
}
