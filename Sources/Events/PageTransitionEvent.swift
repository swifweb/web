//
//  PageTransitionEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class PageTransitionEvent: Event {
    /// Returns whether the webpage was cached by the browser
    public let persisted: Bool
    
    required init (_ event: JSValue) {
        persisted = event.persisted.boolean ?? false
        super.init(event)
    }
}
