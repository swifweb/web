//
//  MouseEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class MouseEvent: UIEvent {
    /// The altKey property returns a `Boolean` value that indicates
    /// whether or not the "ALT" key was pressed when a mouse event was triggered.
    public let altKey: Bool
    
    /// Returns which mouse button was pressed when the mouse event was triggered
    public let button: Int
    
    /// Returns which mouse buttons were pressed when the mouse event was triggered
    public let buttons: [Int]
    
    /// Returns the horizontal coordinate of the mouse pointer, relative to the current window, when the mouse event was triggered
    public let clientX: Int
    
    /// Returns the vertical coordinate of the mouse pointer, relative to the current window, when the mouse event was triggered
    public let clientY: Int
    
    /// Returns whether the "CTRL" key was pressed when the key event was triggered
    public let ctrlKey: Bool
    
    /// Returns true if the specified key is activated
    public func getModifierState() -> Bool {
        jsEvent.getModifierState.function?.callAsFunction(optionalThis: jsEvent.object)?.boolean ?? false
    }
    
    /// Returns whether the "meta" key was pressed when the key event was triggered
    public let metaKey: Bool
    
    /// Returns the horizontal coordinate of the mouse pointer relative to the position of the last mousemove event
    public let movementX: Int
    
    /// Returns the vertical coordinate of the mouse pointer relative to the position of the last mousemove event
    public let movementY: Int
    
    /// Returns the horizontal coordinate of the mouse pointer relative to the position of the edge of the target element
    public let offsetX: Int
    
    /// Returns the vertical coordinate of the mouse pointer relative to the position of the edge of the target element
    public let offsetY: Int
    
    /// Returns the horizontal coordinate of the mouse pointer, relative to the document, when the mouse event was triggered
    public let pageX: Int
    
    /// Returns the vertical coordinate of the mouse pointer, relative to the document, when the mouse event was triggered
    public let pageY: Int
    
//    region
//
//    /// Returns the element related to the element that triggered the mouse event
//    public let relatedTarget: JSValue?
    
    /// Returns the horizontal coordinate of the mouse pointer, relative to the screen, when an event was triggered
    public let screenX: Int
    
    /// Returns the vertical coordinate of the mouse pointer, relative to the screen, when an event was triggered
    public let screenY: Int
    
    /// Returns whether the "SHIFT" key was pressed when the key event was triggered
    public let shiftKey: Bool
    
    /// Returns the Unicode character code of the key that triggered the onkeypress event,
    /// or the Unicode key code of the key that triggered the onkeydown or onkeyup event
    public let which: Int
    
    required init (_ event: JSValue) {
        altKey = event.altKey.boolean ?? false
        button = Int(event.button.number ?? 0)
        if let v = event.buttons.object, let arr = JSArray(v) {
            var buttons: [Int] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                buttons.append(Int(val.number ?? 0))
            }
            self.buttons = buttons
        } else {
            buttons = []
        }
        clientX = Int(event.clientX.number ?? 0)
        clientY = Int(event.clientY.number ?? 0)
        ctrlKey = event.ctrlKey.boolean ?? false
        metaKey = event.metaKey.boolean ?? false
        movementX = Int(event.movementX.number ?? 0)
        movementY = Int(event.movementY.number ?? 0)
        offsetX = Int(event.offsetX.number ?? 0)
        offsetY = Int(event.offsetY.number ?? 0)
        pageX = Int(event.pageX.number ?? 0)
        pageY = Int(event.pageY.number ?? 0)
        screenX = Int(event.screenX.number ?? 0)
        screenY = Int(event.screenY.number ?? 0)
        shiftKey = event.shiftKey.boolean ?? false
        which = Int(event.which.number ?? 0)
        super.init(event)
    }
}
