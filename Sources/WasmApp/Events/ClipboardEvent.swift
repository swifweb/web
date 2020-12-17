//
//  ClipboardEvent.swift
//  WasmApp
//
//  Created by Mihael Isaev on 30.11.2020.
//

import JavaScriptKit

public class ClipboardEvent: HandledEvent {
    /// Returns an object containing the data affected by the clipboard operation
    public let clipboardData: DataTransferObject
    
    override init (_ event: JSValue) {
        clipboardData = DataTransferObject(event.clipboardData)
        super.init(event)
    }
}
