//
//  AnimationEvent.swift
//  WasmApp
//
//  Created by Mihael Isaev on 30.11.2020.
//

import JavaScriptKit

public class AnimationEvent: HandledEvent {
    /// Returns the name of the animation
    public let animationName: String
    
    /// Returns the number of seconds an animation has been running
    public let elapsedTime: Int
    
    /// Returns the name of the pseudo-element of the animation
    public let pseudoElement: String
    
    override init (_ event: JSValue) {
        animationName = event.animationName.string ?? ""
        elapsedTime = Int(event.elapsedTime.number ?? 0)
        pseudoElement = event.pseudoElement.string ?? ""
        super.init(event)
    }
}
