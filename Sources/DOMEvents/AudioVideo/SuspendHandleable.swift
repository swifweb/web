//
//  SuspendHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol SuspendHandleable: DOMEventable {
    @discardableResult
    func onSuspend(_ handler: @escaping () -> Void) -> Self
}

fileprivate class SuspendContainer: Container<Event>, StorageKey {
    typealias Value = SuspendContainer
}

extension SuspendHandleable {
    /// The onsuspend event occurs when the browser is intentionally not getting media data.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onsuspend.asp)
    @discardableResult
    public func onSuspend(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onsuspend", createOrUpdate(SuspendContainer.self, handler))
    }
    
    @discardableResult
    public func onSuspend(_ handler: @escaping () -> Void) -> Self {
        onSuspend { _ in handler() }
    }
}
