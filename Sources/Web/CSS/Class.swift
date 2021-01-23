//
//  Class.swift
//  Web
//
//  Created by Mihael Isaev on 28.12.2020.
//

import Foundation

open class Class: Pointerable {
    public var pointer: Pointer { .init("." + name) }
    
    public var name: String
    
    public init (_ name: String) {
        self.name = name
    }
}