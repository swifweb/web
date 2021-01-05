//
//  WritingModeType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public enum WritingModeType: String, CustomStringConvertible {
    /// Let the content flow horizontally from left to right, vertically from top to bottom
    case horizontalTb = "horizontal-tb"
    
    /// Let the content flow vertically from top to bottom, horizontally from right to left
    case verticalRl = "vertical-rl"
    
    /// Let the content flow vertically from top to bottom, horizontally from left to right
    case verticalLr = "vertical-lr"
    
    public var description: String { rawValue }
}
