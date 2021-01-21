//
//  YAxis.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines where the view is placed at the y-axis.
public struct YAxis: Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var top: YAxis { .init("top") }
    public static var center: YAxis { .init("center") }
    public static var bottom: YAxis { .init("bottom") }
    
    public var description: String { value }
}
