//
//  GridAutoColumnsType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct GridAutoColumnsType: Autoable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var fitContent: Self { .init("fit-content()") }
    
    /// Sets the size of each column depending on the largest item in the column
    public static var maxContent: Self { .init("max-content") }
    
    /// Sets the size of each column depending on the smallest item in the column
    public static var minContent: Self { .init("min-content") }
    
    /// Sets a size range greater than or equal to min and less than or equal to max
    public static func minmax<MIN: UnitValuable, MAX: UnitValuable>(min: MIN, max: MAX) -> Self { .init("minmax(\(min.description), \(max.description))") }
    
    /// Sets a size range greater than or equal to min and less than or equal to max
    public static func minmax<MAX: UnitValuable>(min: AutoValue, max: MAX) -> Self { .init("minmax(\(min.rawValue), \(max.description))") }
    
    /// Sets a size range greater than or equal to min and less than or equal to max
    public static func minmax<MIN: UnitValuable>(min: MIN, max: AutoValue) -> Self { .init("minmax(\(min.description), \(max.rawValue))") }
    
    public var description: String { value }
}
