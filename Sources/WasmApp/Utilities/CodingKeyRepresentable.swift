//
//  CodingKeyRepresentable.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// Capable of being represented by a `CodingKey`.
public protocol CodingKeyRepresentable {
    /// Converts this type to a `CodingKey`.
    var codingKey: CodingKey { get }
}

extension String: CodingKeyRepresentable {
    /// See `CodingKeyRepresentable`
    public var codingKey: CodingKey {
        return BasicCodingKey.key(self)
    }
}

extension Int: CodingKeyRepresentable {
    /// See `CodingKeyRepresentable`
    public var codingKey: CodingKey {
        return BasicCodingKey.index(self)
    }
}

extension Array where Element == CodingKey {
    public var dotPath: String {
        return map { $0.stringValue }.joined(separator: ".")
    }
}
