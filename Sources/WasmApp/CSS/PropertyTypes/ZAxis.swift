//
//  ZAxis.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines where the view is placed at the z-axis (for 3D transformations).
public struct ZAxis: Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}
