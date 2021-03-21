//
//  URLValue.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 09.07.2020.
//

import Foundation

public protocol URLValue: CustomStringConvertible {
    var urlValue: String { get }
    var cssURLValue: String { get }
}

extension URLValue {
    public var cssURLValue: String { "url('\(urlValue)')" }
}

public struct URLValueContainer: CustomStringConvertible {
    public let value: String
    
    public init (_ value: URLValue) {
        self.value = value.urlValue
    }
    
    public var description: String { value }
}

extension String: URLValue {
    public var urlValue: String { self }
    
    public var description: String { urlValue }
}

extension URL: URLValue {
    public var urlValue: String { absoluteString }
    
    public var description: String { urlValue }
}
