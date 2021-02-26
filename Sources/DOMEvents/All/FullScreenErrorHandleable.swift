//
//  FullScreenErrorHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol FullScreenErrorHandleable: DOMEventable {
    @discardableResult
    func onFullScreenError(_ handler: @escaping () -> Void) -> Self
}

fileprivate class FullScreenErrorContainer: Container<Event>, StorageKey {
    typealias Value = FullScreenErrorContainer
}

extension FullScreenErrorHandleable {
    /// The fullscreenerror event occurs when an element can not be viewed in fullscreen mode, even if it has been requested.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_fullscreenerror.asp)
    @discardableResult
    public func onFullScreenError(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onfullscreenerror", createOrUpdate(FullScreenErrorContainer.self, handler))
    }
    
    @discardableResult
    public func onFullScreenError(_ handler: @escaping () -> Void) -> Self {
        onFullScreenError { _ in handler() }
    }
}
