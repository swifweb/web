//
//  MethodType.swift
//  Web
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

public final class MethodType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Default.
    /// Appends the form-data to the URL in name/value pairs: URL?name=value&name=value
    public static var get: MethodType { .init("get") }
    
    /// Sends the form-data as an HTTP post transaction
    public static var post: MethodType { .init("post") }
}
