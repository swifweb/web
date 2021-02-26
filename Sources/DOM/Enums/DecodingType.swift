//
//  DecodingType.swift
//  DOM
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

/// The decoding property of the HTMLImageElement interface
/// represents a hint given to the browser on how it should decode the image.
public final class DecodingType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Default mode, which indicates no preference for the decoding mode.
    /// The browser decides what is best for the user.
    public static var auto: DecodingType { .init("auto") }
    
    /// Decode the image synchronously for atomic presentation with other content.
    public static var sync: DecodingType { .init("sync") }
    
    /// Decode the image asynchronously to reduce delay in presenting other content.
    public static var async: DecodingType { .init("async") }
}
