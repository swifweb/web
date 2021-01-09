//
//  WordWrapType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public enum WordWrapType: String, CustomStringConvertible {
    /// Break words only at allowed break points
    case normal
    
    /// Allows unbreakable words to be broken
    case breakWord = "break-word"
    
    /// Sets this property to its default value.
    ///
    /// [Read about inherit](https://www.w3schools.com/cssref/css_initial.asp)
    case initial
    
    /// Inherits this property from its parent element.
    ///
    /// [Read about inherit](https://www.w3schools.com/cssref/css_inherit.asp)
    case inherit
    
    public var description: String { rawValue }
}
