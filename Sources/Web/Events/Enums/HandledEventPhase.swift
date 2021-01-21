//
//  HandledEventPhase.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

public enum HandledEventPhase: Int {
    case none = 0
    
    /// The event flow is in capturing phase
    case capturing
    
    /// The event flow is in target phase, i.e. it is being evaluated at the event target
    case atTarget
    
    /// The event flow is in bubbling phase
    case bubbling
}
