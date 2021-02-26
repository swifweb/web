//
//  StorageEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class StorageEvent: Event {
    /// Returns the key of the changed storage item
    public let key: String
    
    /// Returns the new value of the changed storage item
    public let newValue: JSValue
    
    /// Returns the old value of the changed storage item
    public let oldValue: JSValue
    
    /// Returns an object representing the affected storage object
    public let storageArea: JSValue
    
    /// Returns the URL of the changed item's document
    public let url: String
    
    required init (_ event: JSValue) {
        key = event.key.string ?? ""
        newValue = event.newValue
        oldValue = event.oldValue
        storageArea = event.storageArea
        url = event.url.string ?? ""
        super.init(event)
    }
}
