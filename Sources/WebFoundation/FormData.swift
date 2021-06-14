//
//  FormData.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 09.03.2021.
//

import JavaScriptKit

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/FormData)
public class FormData {
    public let jsValue: JSValue
    
    public static func jsValue(_ jsValue: JSValue) -> FormData { .init(jsValue) }
    
    private init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    public init (jsForm: JSValue) {
        self.jsValue = JSObject.global.FormData.function!.new(jsForm).jsValue()
    }
    
    public init () {
        self.jsValue = JSObject.global.FormData.function!.new().jsValue()
    }
    
    /// Appends a new value onto an existing key inside a `FormData` object, or adds the key if it does not already exist.
    ///
    /// - Parameters:
    ///   - name: The name of the field whose data is contained in `value`.
    ///   - value:The field's value.
    ///   - filename:The filename reported to the server.
    ///   The default filename for `Blob` objects is "blob".
    ///   The default filename for `File` objects is the file's filename.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/FormData/append)
    @discardableResult
    public func append(_ name: String, _ value: Blob, filename: String? = nil) -> Self {
        jsValue.append.function?.callAsFunction(this: jsValue.object, name, value.jsValue, filename)
        return self
    }
    
    /// Appends a new value onto an existing key inside a `FormData` object, or adds the key if it does not already exist.
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
    
    /// Deletes a key/value pair from a `FormData` object.
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
    
    /// Returns the first value associated with a given key from within a `FormData` object.
    /// - Parameter name: Representing the name of the key you want to retrieve.
    /// - Returns: optional String
    @discardableResult
    public func get(_ name: String) -> String? {
        jsValue.get.function?.callAsFunction(this: jsValue.object, name).string
    }
    
    /// Returns a boolean stating whether a `FormData` object contains a certain key.
    /// - Parameter name: Representing the name of the key you want to test for.
    /// - Returns: boolean balue
    @discardableResult
    public func has(_ name: String) -> Bool {
        jsValue.has.function?.callAsFunction(this: jsValue.object, name).boolean ?? false
    }
    
    /// Sets a new value for an existing header inside a `Headers` object, or adds the header if it does not already exist.
    /// - Parameters:
    ///   - name: The name of the HTTP header you want to add to the `Headers` object.
    ///   - value: The new value you want to set.
    @discardableResult
    public func set(_ name: String, _ value: String) -> Self {
        jsValue.set.function?.callAsFunction(this: jsValue.object, name, value)
        return self
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
