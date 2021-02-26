//
//  UIEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class UIEvent: Event {
    /// Returns a number with details about the event
    public let detail: Int
    
    /// Returns a reference to the Window object where the event occurred
    public let view: JSValue
    
    required init (_ event: JSValue) {
        detail = Int(event.detail.number ?? 0)
        view = event.view
        super.init(event)
    }
}
