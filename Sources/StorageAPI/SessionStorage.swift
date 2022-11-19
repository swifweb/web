//
//  SessionStorage.swift
//  StorageAPI
//
//  Created by Mihael Isaev on 17.11.2020.
//

import WebFoundation

private var _shared: SessionStorage?

// It is more secure to just use swift dictionary, cause it will be not available for user
public final class SessionStorage {
    public static var shared: SessionStorage {
        guard let shared = _shared else {
            let shared = SessionStorage()
            _shared = shared
            return shared
        }
        return shared
    }
    
    /// Name of the element inside DOM
    let domElementName = "sessionStorage"
    
    /// Reference to DOM-object
    public let domElement: JSValue
    
    /// (key, oldValue, newValue) -> Void
    private var changeListeners: [(String, JSValue, JSValue) -> Void] = []
    private var clearListeners: [() -> Void] = []
    
    @State public private(set) var length: Int = 0
    
    public static var length: Int { shared.length }
    
    private init () {
        #if arch(wasm32)
        domElement = JSObject.global[domElementName]
        #else
        domElement = JSValue("")
        #endif
        update()
    }
    
    public func notifyAboutChanges(_ event: JSValue) {
        update()
        guard length > 0 else {
            notifyAboutClear()
            return
        }
        guard
            let oldValue = event.object?.oldValue,
            let key = event.object?.key.string,
            let newValue = event.object?.newValue
        else { return }
        notifyAboutChanges(key: key, oldValue: oldValue, newValue: newValue)
    }
    
    private func notifyAboutChanges(key: String, oldValue: JSValue, newValue: JSValue) {
        changeListeners.forEach { $0(key, oldValue, newValue) }
    }
    
    private func notifyAboutClear() {
        clearListeners.forEach { $0() }
    }
    
    private func update() {
        #if arch(wasm32)
        length = Int(domElement.length.number ?? 0)
        #endif
    }
    
    /// Use this method to add/update value in the storage
    public static func set<V: ConvertibleToJSValue>(_ value: V, forKey key: String) {
        shared.set(value, forKey: key)
    }
    
    /// Use this method to add/update value in the storage
    public func set<V: ConvertibleToJSValue>(_ value: V, forKey key: String) {
        let oldValue = self.value(forKey: key) ?? .null
        domElement.setItem.function!.callAsFunction(optionalThis: domElement.object, key, value.jsValue())
        update()
        notifyAboutChanges(key: key, oldValue: oldValue, newValue: value.jsValue())
    }
    
    /// Returns absract value for `key`
    public static func value(forKey key: String) -> JSValue? {
        shared.value(forKey: key)
    }
    
    /// Returns absract value for `key`
    public func value(forKey key: String) -> JSValue? {
        let value = domElement.getItem.function!.callAsFunction(optionalThis: domElement.object, key)
        switch value {
        case .null: return nil
        default: return value
        }
    }
    
    /// Returns `String` value for `key` or `nil`
    public static func string(forKey key: String) -> String? {
        shared.string(forKey: key)
    }
    
    /// Returns `String` value for `key` or `nil`
    public func string(forKey key: String) -> String? {
        guard let value: JSValue = value(forKey: key) else { return nil }
        switch value {
        case .string: return value.string
        default: return nil
        }
    }
    
    /// Returns `Int` value for `key` or `nil`
    public static func integer(forKey key: String) -> Int? {
        shared.integer(forKey: key)
    }
    
    /// Returns `Int` value for `key` or `nil`
    public func integer(forKey key: String) -> Int? {
        guard let value: JSValue = value(forKey: key) else { return nil }
        switch value {
        case .number:
            guard let number = value.number else { return nil }
            return Int(number)
        default: return nil
        }
    }
    
    /// Returns `Double` value for `key` or `nil`
    public static func double(forKey key: String) -> Double? {
        shared.double(forKey: key)
    }
    
    /// Returns `Double` value for `key` or `nil`
    public func double(forKey key: String) -> Double? {
        guard let value: JSValue = value(forKey: key) else { return nil }
        switch value {
        case .number: return value.number
        default: return nil
        }
    }
    
    /// Removes item by `key` from the storage
    public static func removeItem(forKey key: String) {
        shared.removeItem(forKey: key)
    }
    
    /// Removes item by `key` from the storage
    public func removeItem(forKey key: String) {
        let oldValue = value(forKey: key) ?? .null
        domElement.removeItem.function!.callAsFunction(optionalThis: domElement.object, key)
        update()
        notifyAboutChanges(key: key, oldValue: oldValue, newValue: .null)
    }
    
    /// Removes all items from the storage
    public static func clear() {
        shared.clear()
    }
    
    /// Removes all items from the storage
    public func clear() {
        domElement.clear.function!.callAsFunction(optionalThis: domElement.object)
        length = 0
        notifyAboutClear()
    }
    
    /// Returns `key` at specified `index`
    public static func key(at index: Int) -> String? {
        shared.key(at: index)
    }
    
    /// Returns `key` at specified `index`
    public func key(at index: Int) -> String? {
        domElement.key.function!.callAsFunction(optionalThis: domElement.object, index)?.string
    }
    
    /// Calls handler if something has been changed in the storage
    public static func onChange(_ handler: @escaping (String, JSValue, JSValue) -> Void) {
        shared.onChange(handler)
    }
    
    /// Calls handler if something has been changed in the storage
    public func onChange(_ handler: @escaping (String, JSValue, JSValue) -> Void) {
        changeListeners.append(handler)
    }
    
    /// Calls handler if clear command was called or just last item was removed from the storage
    public static func onClear(_ handler: @escaping () -> Void) {
        shared.onClear(handler)
    }
    
    /// Calls handler if clear command was called or just last item was removed from the storage
    public func onClear(_ handler: @escaping () -> Void) {
        clearListeners.append(handler)
    }
}
