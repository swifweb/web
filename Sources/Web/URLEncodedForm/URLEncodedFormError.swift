//
//  URLEncodedFormError.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// Errors thrown while encoding/decoding `application/x-www-form-urlencoded` data.
enum URLEncodedFormError: Error {
    case malformedKey(key: Substring)
}

extension URLEncodedFormError: AbortError {
    var reason: String {
        switch self {
        case .malformedKey(let path):
            return "Malformed form-urlencoded key encountered: \(path)"
        }
    }
}
