//
//  CopyHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol CopyHandleable: DOMEventable {
    @discardableResult
    func onCopy(_ handler: @escaping () -> Void) -> Self
}

fileprivate class CopyContainer: Container<ClipboardEvent>, StorageKey {
    typealias Value = CopyContainer
}

extension CopyHandleable {
    /// The `oncopy` event occurs when the user copies the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncopy.asp)
    @discardableResult
    public func onCopy(_ handler: @escaping (Self, ClipboardEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("oncopy", createOrUpdate(CopyContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The `oncopy` event occurs when the user copies the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncopy.asp)
    @discardableResult
    public func onCopy(_ handler: @escaping (Self) -> Void) -> Self {
        onCopy { _,_ in handler(self) }
    }
    
    /// The `oncopy` event occurs when the user copies the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncopy.asp)
    @discardableResult
    public func onCopy(_ handler: @escaping () -> Void) -> Self {
        onCopy { _ in handler() }
    }
}
