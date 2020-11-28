//
//  BasicCodingKey.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// A basic `CodingKey` implementation.
public enum BasicCodingKey: CodingKey {
    case key(String)
    case index(Int)
    
    /// See `CodingKey`.
    public var stringValue: String {
        switch self {
        case .index(let index): return "\(index)"
        case .key(let key): return key
        }
    }
    
    /// See `CodingKey`.
    public var intValue: Int? {
        switch self {
        case .index(let index): return index
        case .key(let key): return Int(key)
        }
    }
    
    /// See `CodingKey`.
    public init?(stringValue: String) {
        self = .key(stringValue)
    }
    
    /// See `CodingKey`.
    public init?(intValue: Int) {
        self = .index(intValue)
    }

    public init(_ codingKey: CodingKey) {
        if let intValue = codingKey.intValue {
            self = .index(intValue)
        } else {
            self = .key(codingKey.stringValue)
        }
    }

    public init(_ codingKeyRepresentable: CodingKeyRepresentable) {
        self.init(codingKeyRepresentable.codingKey)
    }
}

extension BasicCodingKey: CustomStringConvertible {
    public var description: String {
        switch self {
        case .index(let index):
            return "\(index)"
        case .key(let key):
            return key.description
        }
    }
}

extension BasicCodingKey: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .index(let index):
            return "\(index)"
        case .key(let key):
            return key.debugDescription
        }
    }
}
