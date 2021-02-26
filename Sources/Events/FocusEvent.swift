//
//  FocusEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class FocusEvent: UIEvent {
//    /// Returns the element related to the element that triggered the event
//    public let relatedTarget: JSValue?
    
    required init (_ event: JSValue) {
        super.init(event)
    }
}
