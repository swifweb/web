//
//  Valuable.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol Valuable {
    var value: String { get }
    
    init (_ value: String)
}
