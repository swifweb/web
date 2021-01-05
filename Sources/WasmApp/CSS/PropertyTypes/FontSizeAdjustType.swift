//
//  FontSizeAdjustType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontSizeAdjustType: Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}
