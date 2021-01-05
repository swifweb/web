//
//  HyphensType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct HyphensType: Noneable, Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default. Words are only hyphenated at &hyphen; or &shy; (if needed)
    public static var manual: Self { .init("manual") }
    
    public var description: String { value }
}
