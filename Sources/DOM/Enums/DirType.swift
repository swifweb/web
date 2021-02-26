//
//  DirType.swift
//  DOM
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

/// The decoding property of the HTMLImageElement interface
/// represents a hint given to the browser on how it should decode the image.
public final class DirType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Lets the user agent decide.
    /// It uses a basic algorithm as it parses the characters inside the element
    /// until it finds a character with a strong directionality,
    /// then applies that directionality to the whole element.
    public static var auto: DirType { .init("auto") }
    
    /// Means left to right and is to be used for languages
    /// that are written from the left to the right (like English);
    public static var ltr: DirType { .init("ltr") }
    
    /// Means right to left and is to be used for languages
    /// that are written from the right to the left (like Arabic);
    public static var rtl: DirType { .init("rtl") }
}
