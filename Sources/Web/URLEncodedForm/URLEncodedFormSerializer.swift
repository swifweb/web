//
//  URLEncodedFormSerializer.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

struct URLEncodedFormSerializer {
    let splitVariablesOn: Character
    let splitKeyValueOn: Character
    
    /// Create a new form-urlencoded data parser.
    init(splitVariablesOn: Character = "&", splitKeyValueOn: Character = "=") {
        self.splitVariablesOn = splitVariablesOn
        self.splitKeyValueOn = splitKeyValueOn
    }
    
    func serialize(_ data: URLEncodedFormData, codingPath: [CodingKey] = []) throws -> String {
        var entries: [String] = []
        let key = try codingPath.toURLEncodedKey()
        for value in data.values {
            if codingPath.count == 0 {
                try entries.append(value.asUrlEncoded())
            } else {
                try entries.append(key + String(splitKeyValueOn) + value.asUrlEncoded())
            }
        }
        for (key, child) in data.children {
            entries.append(try serialize(child, codingPath: codingPath + [_CodingKey(stringValue: key) as CodingKey]))
        }
        return entries.joined(separator: String(splitVariablesOn))
    }
    
    struct _CodingKey: CodingKey {
        var stringValue: String
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = "\(intValue)"
        }
    }
}

extension Array where Element == CodingKey {
    func toURLEncodedKey() throws -> String {
        if count < 1 {
            return ""
        }
        return try self[0].stringValue.urlEncoded(codingPath: self) + self[1...].map({ (key: CodingKey) -> String in
            return try "[" + key.stringValue.urlEncoded(codingPath: self) + "]"
        }).joined()
    }
}

// MARK: Utilties

extension String {
    /// Prepares a `String` for inclusion in form-urlencoded data.
    func urlEncoded(codingPath: [CodingKey] = []) throws -> String {
        var result: [UInt8] = []
        result.reserveCapacity(utf8.count)

        for byte in utf8 {
            switch byte {
            case 0x41...0x5A, 0x61...0x7A, 0x30...0x39, 0x2A, 0x2D, 0x2E, 0x5F:
                result.append(byte)
            case 0x20:
                result.append(0x2B)
            default:
                result.append(0x25)
                result.append(_urlEncodedHexDigit(byte >> 4))
                result.append(_urlEncodedHexDigit(byte & 0x0F))
            }
        }

        return String(decoding: result, as: UTF8.self)
    }
}

private func _urlEncodedHexDigit(_ value: UInt8) -> UInt8 {
    value < 10 ? 0x30 + value : 0x41 + value - 10
}
