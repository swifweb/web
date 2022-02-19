//
//  PasteHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol PasteHandleable: DOMEventable {
    @discardableResult
    func onPaste(_ handler: @escaping () -> Void) -> Self
}

fileprivate class PasteContainer: Container<ClipboardEvent>, StorageKey {
    typealias Value = PasteContainer
}

extension PasteHandleable {
    /// The onpaste event occurs when the user pastes some content in an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpaste.asp)
    @discardableResult
    public func onPaste(_ handler: @escaping (Self, ClipboardEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onpaste", createOrUpdate(PasteContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The onpaste event occurs when the user pastes some content in an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpaste.asp)
    @discardableResult
    public func onPaste(_ handler: @escaping (Self) -> Void) -> Self {
        onPaste { _,_ in handler(self) }
    }
    
    /// The onpaste event occurs when the user pastes some content in an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpaste.asp)
    @discardableResult
    public func onPaste(_ handler: @escaping () -> Void) -> Self {
        onPaste { _ in handler() }
    }
}
