//
//  InputButtonType.swift
//  Web
//
//  Created by Mihael Isaev on 24.12.2020.
//

import Foundation

public final class InputButtonType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Default.
    public static var button: InputButtonType { .init("button") }
    
    ///
    public static var reset: InputButtonType { .init("reset") }
    
    ///
    public static var submit: InputButtonType { .init("submit") }
    
    ///
    public static var image: InputButtonType { .init("image") }
}
