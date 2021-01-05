//
//  URLValue.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

import Foundation

public protocol URLValue: CustomStringConvertible {
    var urlValue: String { get }
}

extension URLValue {
    public func buildURL(_ v: String) -> String {
        "url('\(v)')"
    }
}

public struct URLValueContainer: CustomStringConvertible {
    public let value: String
    
    public init (_ value: URLValue) {
        self.value = value.urlValue
    }
    
    public var description: String { value }
}

extension String: URLValue {
    public var urlValue: String { buildURL(self) }
    
    public var description: String { urlValue }
}

extension URL: URLValue {
    public var urlValue: String { buildURL(absoluteString) }
    
    public var description: String { urlValue }
}
