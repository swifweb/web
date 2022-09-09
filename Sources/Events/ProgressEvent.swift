//
//  ProgressEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class ProgressEvent: Event {
    /// Returns whether the length of the progress can be computable or not
    public let lengthComputable: Bool
    
    /// Returns how much work has been loaded
    public let loaded: Int
    
    /// Returns the total amount of work that will be loaded
    public let total: Int
    
    required init (_ event: JSValue) {
        lengthComputable = event.lengthComputable.boolean ?? false
        loaded = Int(event.total.number ?? 0)
        total = Int(event.total.number ?? 0)
        super.init(event)
    }
}
