//
//  Storage.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 24.02.2021.
//

import Foundation

public struct Storage {
    var storage: [ObjectIdentifier: AnyStorageValue]

    struct Value<T>: AnyStorageValue {
        var value: T
        var onShutdown: (() -> Void)?
        func shutdown() {
            onShutdown?()
        }
    }
    
    public init() {
        storage = [:]
    }

    public mutating func clear() {
        storage = [:]
    }

    public subscript<Key>(_ key: Key.Type) -> Key.Value? where Key: StorageKey {
        get { get(Key.self) }
        set { set(Key.self, to: newValue) }
    }

    public func contains<Key>(_ key: Key.Type) -> Bool {
        storage.keys.contains(ObjectIdentifier(Key.self))
    }

    public func get<Key>(_ key: Key.Type) -> Key.Value? where Key: StorageKey {
        guard let value = storage[ObjectIdentifier(Key.self)] as? Value<Key.Value> else {
            return nil
        }
        return value.value
    }

    public mutating func set<Key>(_ key: Key.Type, to value: Key.Value?) where Key: StorageKey {
        let key = ObjectIdentifier(Key.self)
        if let value = value {
            storage[key] = Value(value: value)
        } else if let _ = storage[key] {
            storage[key] = nil
        }
    }
    
    public func shutdown() {
        self.storage.values.forEach {
            $0.shutdown()
        }
    }
}

public protocol AnyStorageValue {
    func shutdown()
}

public protocol StorageKey {
    associatedtype Value
}
