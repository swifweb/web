//
//  URLSearchParams.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 09.03.2021.
//

import Foundation
import JavaScriptKit

///Defines utility methods to work with the query string of a URL.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams)
public class URLSearchParams {
    public let jsValue: JSValue
    
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    public init (_ params: String) {
        self.jsValue = JSObject.global.URLSearchParams.function?.new(params).jsValue() ?? .undefined
    }
    
    public init (_ params: [[String: String]]) {
        self.jsValue = JSObject.global.URLSearchParams.function?.new(params.map { $0.jsValue() }.jsValue()).jsValue() ?? .undefined
    }
    
    public init (_ params: [String: String]) {
        self.jsValue = JSObject.global.URLSearchParams.function?.new(params.jsValue()).jsValue() ?? .undefined
    }
    
    /// Appends a specified key/value pair as a new search parameter.
    ///
    /// - Parameters:
    ///   - name: The name of the field whose data is contained in `value`.
    ///   - value:The field's value.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/FormData/append)
    @discardableResult
    public func append(_ name: String, _ value: String) -> Self {
        jsValue.append.function?.callAsFunction(this: jsValue.object, name, value)
        return self
    }
    
    /// Deletes the given search parameter, and its associated value, from the list of all search parameters.
    ///
    /// - Parameters:
    ///   - name: The name of the key you want to delete.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/FormData)
    @discardableResult
    public func delete(_ name: String) -> Self {
        jsValue.delete.function?.callAsFunction(this: jsValue.object, name)
        return self
    }
    
    /// Returns the first value associated with the given search parameter.
    /// - Parameter name: Representing the name of the key you want to retrieve.
    /// - Returns: optional String
    @discardableResult
    public func get(_ name: String) -> String? {
        jsValue.get.function?.callAsFunction(this: jsValue.object, name).string
    }
    
    /// Indicating if such a given parameter exists.
    /// - Parameter name: Representing the name of the key you want to test for.
    /// - Returns: boolean balue
    @discardableResult
    public func has(_ name: String) -> Bool {
        jsValue.has.function?.callAsFunction(this: jsValue.object, name).boolean ?? false
    }
    
    /// Sets the value associated with a given search parameter to the given value.
    /// If there are several values, the others are deleted.
    ///
    /// - Parameters:
    ///   - name: The name of the HTTP header you want to add to the `Headers` object.
    ///   - value: The new value you want to set.
    @discardableResult
    public func set(_ name: String, _ value: String) -> Self {
        jsValue.set.function?.callAsFunction(this: jsValue.object, name, value)
        return self
    }
    
    /// Sorts all key/value pairs, if any, by their keys.
    @discardableResult
    public func sort(_ name: String) -> String? {
        jsValue.sort.function?.callAsFunction(this: jsValue.object, name).string
    }
    
    public var dictionary: [String: String] {
        guard let iterator = jsValue.keys.function?.callAsFunction(this: jsValue.object) else { return [:] }
        func nextIteratorValue() -> String? {
            guard let value: JSValue = iterator.next.function?.callAsFunction(this: iterator.object).value else { return nil }
            guard !value.isNull && !value.isUndefined else { return nil }
            return value.string
        }
        var dictionary: [String: String] = [:]
        while let key = nextIteratorValue() {
            if let value = get(key) {
                dictionary[key] = value
            }
        }
        return dictionary
    }
    
    public var keys: [String] {
        Array(dictionary.keys)
    }
    
    public var values: [String] {
        Array(dictionary.values)
    }
}
