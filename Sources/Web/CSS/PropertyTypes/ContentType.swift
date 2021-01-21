//
//  ContentType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct ContentType: Initialable, Inheritable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Sets the content, if specified, to normal, which default is "none" (which is nothing)
    public static var normal: Self { .init("normal") }
    
    /// Sets the content as a counter
    public static var counter: Self { .init("counter") }
    
    /// Sets the content as one of the selector's attribute
    public static func attr(_ attribute: String) -> Self { .init("attr(\(attribute))") }
    
    /// Sets the content to the text you specify
    public static func string(_ v: String) -> Self { .init(v) }
    
    /// Sets the content to be an opening quote
    public static var openQuote: Self { .init("open-quote") }
    
    /// Sets the content to be a closing quote
    public static var closeQuote: Self { .init("close-quote") }
    
    /// Removes the opening quote from the content, if specified
    public static var noOpenQuote: Self { .init("no-open-quote") }
    
    /// Removes the closing quote from the content, if specified
    public static var noCloseQuote: Self { .init("no-close-quote") }
    
    /// Sets the content to be some kind of media (an image, a sound, a video, etc.)
    public static func url(_ url: String) -> Self { .init("url(\(url))") }
    
    public var description: String { value }
}
