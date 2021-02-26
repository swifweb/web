//
//  HashChangeEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class HashChangeEvent: Event {
    /// Returns the URL of the document, after the hash has been changed
    public let newURL: String
    
    /// Returns the URL of the document, before the hash was changed
    public let oldURL: String
    
    required init (_ event: JSValue) {
        newURL = event.newURL.string ?? ""
        oldURL = event.oldURL.string ?? ""
        super.init(event)
    }
}
