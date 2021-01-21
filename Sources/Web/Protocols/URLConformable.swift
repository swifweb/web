//
//  URLConformable.swift
//  
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol URLConformable {
    var stringValue: String { get }
}

extension String: URLConformable {
    public var stringValue: String { self }
}

extension URL: URLConformable {
    public var stringValue: String { self.absoluteString }
}

extension Optional: URLConformable where Wrapped: URLConformable {
    public var stringValue: String { self?.stringValue ?? "" }
}
