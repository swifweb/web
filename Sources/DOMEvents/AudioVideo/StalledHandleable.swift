//
//  StalledHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol StalledHandleable: DOMEventable {
    @discardableResult
    func onStalled(_ handler: @escaping () -> Void) -> Self
}

fileprivate class StalledContainer: Container<Event>, StorageKey {
    typealias Value = StalledContainer
}

extension StalledHandleable {
    /// The `onstalled` event occurs when the browser is trying to get media data, but data is not available.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onstalled.asp)
    @discardableResult
    public func onStalled(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onstalled", createOrUpdate(StalledContainer.self, handler))
    }
    
    @discardableResult
    public func onStalled(_ handler: @escaping () -> Void) -> Self {
        onStalled { _ in handler() }
    }
}
