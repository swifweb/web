//
//  GlobalContext.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 25.02.2021.
//

private let _globalContext = GlobalContext()

public class GlobalContext {
    lazy var storage: Storage = .init()
    
    init () {}
    
    public static subscript<Key>(_ key: Key.Type) -> Key.Value? where Key: StorageKey {
        get { _globalContext.storage.get(Key.self) }
        set { _globalContext.storage.set(Key.self, to: newValue) }
    }
}
