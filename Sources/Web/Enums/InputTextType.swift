//
//  InputTextType.swift
//  Web
//
//  Created by Mihael Isaev on 21.12.2020.
//

import Foundation

public final class InputTextType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// No virtual keyboard. For when the page implements its own keyboard input control.
    public static var none: InputTextType { .init("none") }
    
    /// Default.
    /// Standard input keyboard for the user's current locale.
    public static var text: InputTextType { .init("text") }
    
    /// Fractional numeric input keyboard containing the digits
    /// and decimal separator for the user's locale (typically . or ,).
    /// Devices may or may not show a minus key (-).
    public static var decimal: InputTextType { .init("decimal") }
    
    /// Numeric input keyboard, but only requires the digits 0–9.
    /// Devices may or may not show a minus key.
    public static var numeric: InputTextType { .init("numeric") }
    
    /// A telephone keypad input, including the digits 0–9, the asterisk (*), and the pound (#) key.
    /// Inputs that require a telephone number should typically use <input type="tel">instead.
    public static var tel: InputTextType { .init("tel") }
    
    /// A virtual keyboard optimized for search input.
    /// For instance, the return/submit key may be labeled “Search”,
    /// along with possible other optimizations.
    /// Inputs that require a search query should typically use <input type="search"> instead.
    public static var search: InputTextType { .init("search") }
    
    /// A virtual keyboard optimized for entering email addresses.
    /// Typically includes the @ character as well as other optimizations.
    /// Inputs that require email addresses should typically use <input type="email"> instead.
    public static var email: InputTextType { .init("email") }
    
    /// A keypad optimized for entering URLs.
    /// This may have the / key more prominent, for example.
    /// Enhanced features could include history access and so on.
    /// Inputs that require a URL should typically use <input type="url"> instead.
    public static var url: InputTextType { .init("url") }
}
