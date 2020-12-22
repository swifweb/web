//
//  EncType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

/// The enctype attribute specifies how the form-data should be encoded when submitting it to the server.
public final class EncType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Default.
    /// All characters are encoded before sent
    /// (spaces are converted to "+" symbols, and special characters are converted to ASCII HEX values)
    public static var xWwwFormUrlEncoded: EncType { .init("application/x-www-form-urlencoded") }
    
    /// No characters are encoded.
    /// This value is required when you are using forms that have a file upload control
    public static var multipartFormData: EncType { .init("multipart/form-data") }
    
    /// Spaces are converted to "+" symbols, but no special characters are encoded
    public static var textPlain: EncType { .init("text/plain") }
}
