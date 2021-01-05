//
//  UserSelectType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public enum UserSelectType: String, CustomStringConvertible {
    /// Default. Text can be selected if the browser allows it
    case auto
    
    /// Prevent text selection
    case none
    
    /// The text can be selected by the user
    case text
    
    /// Text selection is made with one click instead of a double-click
    case all
    
    public var description: String { rawValue }
}
