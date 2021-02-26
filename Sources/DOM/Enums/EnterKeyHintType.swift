//
//  EnterKeyHintType.swift
//  DOM
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

/// The enterkeyhint content attribute is an enumerated attribute
/// that specifies what action label (or icon) to present for the enter key on virtual keyboards.
public final class EnterKeyHintType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// The user agent should present a cue for the operation 'enter', typically inserting a new line.
    public static var enter: EnterKeyHintType { .init("enter") }
    
    /// The user agent should present a cue for the operation 'done',
    /// typically meaning there is nothing more to input and the input method editor (IME) will be closed.
    public static var done: EnterKeyHintType { .init("done") }
    
    /// The user agent should present a cue for the operation 'go',
    /// typically meaning to take the user to the target of the text they typed.
    public static var go: EnterKeyHintType { .init("go") }
    
    /// The user agent should present a cue for the operation 'next',
    /// typically taking the user to the next field that will accept text.
    public static var next: EnterKeyHintType { .init("next") }
    
    /// The user agent should present a cue for the operation 'previous',
    /// typically taking the user to the previous field that will accept text.
    public static var previous: EnterKeyHintType { .init("previous") }
    
    /// The user agent should present a cue for the operation 'search',
    /// typically taking the user to the results of searching for the text they have typed.
    public static var search: EnterKeyHintType { .init("search") }
    
    /// The user agent should present a cue for the operation 'send',
    /// typically delivering the text to its target.
    public static var send: EnterKeyHintType { .init("send") }
}
