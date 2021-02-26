//
//  ClipboardEvent.swift
//  Events
//
//  Created by Mihael Isaev on 30.11.2020.
//

import JavaScriptKit

public class ClipboardEvent: Event {
    /// Returns an object containing the data affected by the clipboard operation
    public let clipboardData: DataTransferObject
    
    required init (_ event: JSValue) {
        clipboardData = DataTransferObject(event.clipboardData)
        super.init(event)
    }
}
