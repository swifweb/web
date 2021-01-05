//
//  TabSizeType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TabSizeType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The number of space-characters to be displayed for each tab-character. Default value is 8
    public static func number(_ v: NumericValue) -> Self { .init(v.numericValue) }
    
    public var description: String { value }
}
