//
//  Headers.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 15.03.2021.
//

import WebFoundation

/// Allows you to perform various actions on HTTP request and response headers.
/// These actions include retrieving, setting, adding to, and removing headers from the list of the request's headers.
public final class Headers: ExpressibleByDictionaryLiteral {
    let jsValue: JSValue
    
    /// Initializer
    public init () {
        jsValue = JSObject.global.Headers.function?.new().jsValue ?? .undefined
    }
    
    init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    public init(dictionaryLiteral elements: (String, String)...) {
        jsValue = JSObject.global.Headers.function?.new().jsValue ?? .undefined
        elements.forEach { key, value in
            set(key, value)
        }
    }
    
    /// The `append()` method of the Headers interface appends a new value onto an existing header
    /// inside a `Headers` object, or adds the header if it does not already exist.
    ///
    /// The difference between `set()` and `append()` is that if the specified header already exists
    /// and accepts multiple values, `set()` will overwrite the existing value with the new one, whereas `append()`
    /// will append the new value onto the end of the set of values.
    ///
    /// - Parameters:
    ///   - name: The name of the HTTP header you want to add to the `Headers` object.
    ///   - value: The value of the HTTP header you want to add.
    @discardableResult
    public func append(_ name: String, _ value: String) -> Self {
        jsValue.append.function?.callAsFunction(optionalThis: jsValue.object, name, value)
        return self
    }
    
    /// Deletes a header from the current `Headers` object.
    /// - Parameter name: The name of the HTTP header you want to delete from the `Headers` object.
    @discardableResult
    public func delete(_ name: String) -> Self {
        jsValue.delete.function?.callAsFunction(optionalThis: jsValue.object, name)
        return self
    }
    
    /// Returns a header alue by the given name if it is exists in the current `Headers` object.
    /// - Parameter name: The name of the HTTP header whose values you want to retrieve from the `Headers` object.
    /// - Returns: optional String
    @discardableResult
    public func get(_ name: String) -> String? {
        jsValue.get.function?.callAsFunction(optionalThis: jsValue.object, name)?.string
    }
    
    /// - Parameter name: The name of the HTTP header whose values you want to check in the `Headers` object.
    /// - Returns: boolean balue
    @discardableResult
    public func has(_ name: String) -> Bool {
        jsValue.has.function?.callAsFunction(optionalThis: jsValue.object, name)?.boolean ?? false
    }
    
    /// Sets a new value for an existing header inside a `Headers` object, or adds the header if it does not already exist.
    /// - Parameters:
    ///   - name: The name of the HTTP header you want to add to the `Headers` object.
    ///   - value: The new value you want to set.
    @discardableResult
    public func set(_ name: String, _ value: String) -> Self {
        jsValue.set.function?.callAsFunction(optionalThis: jsValue.object, name, value)
        return self
    }
    
    public var dictionary: [String: String] {
        guard let iterator = jsValue.keys.function?.callAsFunction(optionalThis: jsValue.object) else { return [:] }
        func nextIteratorValue() -> String? {
            guard let value: JSValue = iterator.next.function?.callAsFunction(optionalThis: iterator.object)?.value else { return nil }
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
