//
//  Id.swift
//  Web
//
//  Created by Mihael Isaev on 28.12.2020.
//

import Foundation

open class Id: Pointerable, ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public var pointer: Pointer { .init("#" + name) }
    
    public var name: String
    
    required public init (stringLiteral name: String) {
        self.name = name
    }
}
