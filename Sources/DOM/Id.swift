//
//  Id.swift
//  DOM
//
//  Created by Mihael Isaev on 28.12.2020.
//

import FoundationEssentials

open class Id: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public var name: String
    
    required public init (stringLiteral name: String) {
        self.name = name
    }
    
    public init (_ name: String) {
        self.name = name
    }
}
