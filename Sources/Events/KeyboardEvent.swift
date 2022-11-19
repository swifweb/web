//
//  KeyboardEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class KeyboardEvent: UIEvent {
    /// The altKey property returns a `Boolean` value that indicates
    /// whether or not the "ALT" key was pressed when a keyboard event was triggered.
    public let altKey: Bool
    
    /// Returns the Unicode character code of the key that triggered the event
    public let charCode: Int
    
    /// Returns the code of the key that triggered the event
    public let code: String
    
    /// Returns whether the "CTRL" key was pressed when the key event was triggered
    public let ctrlKey: Bool
    
    /// Returns true if the specified key is activated
    public func getModifierState() -> Bool {
        jsEvent.getModifierState.function?.callAsFunction(optionalThis: jsEvent.object)?.boolean ?? false
    }
    
    /// Returns whether the state of the event is composing or not
    public let isComposing: Bool
    
    /// Returns the key value of the key represented by the event
    public let key: String
    
    /// Returns the Unicode character code of the key that triggered the `onkeypress` event,
    /// or the Unicode key code of the key that triggered the `onkeydown` or `onkeyup` event
    public let keyCode: Int
    
    /// Returns the location of a key on the keyboard or device
    public let location: KeyboardEventLocation
    
    /// Returns whether the "meta" key was pressed when the key event was triggered
    public let metaKey: Bool
    
    /// Returns whether a key is being hold down repeatedly, or not
    public let `repeat`: Bool
    
    /// Returns whether the "SHIFT" key was pressed when the key event was triggered
    public let shiftKey: Bool
    
    /// Returns the Unicode character code of the key that triggered the onkeypress event,
    /// or the Unicode key code of the key that triggered the onkeydown or onkeyup event
    public let which: Int
    
    required init (_ event: JSValue) {
        altKey = event.altKey.boolean ?? false
        charCode = Int(event.charCode.number ?? 0)
        code = event.code.string ?? ""
        ctrlKey = event.ctrlKey.boolean ?? false
        isComposing = event.isComposing.boolean ?? false
        key = event.key.string ?? ""
        keyCode = Int(event.keyCode.number ?? 0)
        location = KeyboardEventLocation(rawValue: Int(event.location.number ?? 0)) ?? .standard
        metaKey = event.metaKey.boolean ?? false
        `repeat` = event.repeat.boolean ?? false
        shiftKey = event.shiftKey.boolean ?? false
        which = Int(event.which.number ?? 0)
        super.init(event)
    }
}
