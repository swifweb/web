//
//  AutocapitalizeType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public enum AutocapitalizeType: String {
    /// No autocapitalization is applied (all letters default to lowercase)
    case none
    
    /// The first letter of each sentence defaults to a capital letter; all other letters default to lowercase
    case sentences
    
    /// The first letter of each word defaults to a capital letter; all other letters default to lowercase
    case words
    
    /// All letters should default to uppercase
    case characters
}
