//
//  Class.swift
//  DOM
//
//  Created by Mihael Isaev on 28.12.2020.
//

import Foundation

open class Class: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public var names: [String]
    
    required public init (stringLiteral name: String) {
        self.names = name.components(separatedBy: " ")
    }
    
    public init (_ name: String) {
        self.names = name.components(separatedBy: " ")
    }
}
