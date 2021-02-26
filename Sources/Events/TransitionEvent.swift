//
//  TransitionEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class TransitionEvent: Event {
    /// Returns the name of the transition
    public let propertyName: String
    
    /// Returns the number of seconds a transition has been running
    public let elapsedTime: Int
    
    /// Returns the name of the pseudo-element of the transition
    public let pseudoElement: String
    
    required init (_ event: JSValue) {
        propertyName = event.propertyName.string ?? ""
        elapsedTime = Int(event.elapsedTime.number ?? 0)
        pseudoElement = event.pseudoElement.string ?? ""
        super.init(event)
    }
}
