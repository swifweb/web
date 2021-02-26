//
//  KeyboardEventLocation.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

public enum KeyboardEventLocation: Int {
    /// The key is not pressed on the right or left side of the keyboard,
    /// and was not pressed on the numeric keypad
    /// (this value represents almost every key on the keyboard, e.g. "A", "U", "SPACE" or "5")
    case standard = 0
    
    /// A left key was pressed (e.g. the left "CTRL" key or left "ALT" key on a standard 101 key US keyboard)
    case left
    
    /// A right key was pressed (e.g. the right "CTRL" key or right "CTRL" key on a standard 101 key US keyboard)
    case right
    
    /// The key was pressed on the numeric keypad (e.g. the "2" key on the right side on a standard keyboard)
    case numpad
}
