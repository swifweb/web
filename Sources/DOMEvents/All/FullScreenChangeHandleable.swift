//
//  FullScreenChangeHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol FullScreenChangeHandleable: DOMEventable {
    @discardableResult
    func onFullScreenChange(_ handler: @escaping () -> Void) -> Self
}

fileprivate class FullScreenChangeContainer: Container<Event>, StorageKey {
    typealias Value = FullScreenChangeContainer
}

extension FullScreenChangeHandleable {
    /// The fullscreenchange event occurs when an element is viewed in fullscreen mode.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_fullscreenchange.asp)
    @discardableResult
    public func onFullScreenChange(_ handler: @escaping (Self, Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onfullscreenchange", createOrUpdate(FullScreenChangeContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The fullscreenchange event occurs when an element is viewed in fullscreen mode.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_fullscreenchange.asp)
    @discardableResult
    public func onFullScreenChange(_ handler: @escaping (Self) -> Void) -> Self {
        onFullScreenChange { _,_ in handler(self) }
    }
    
    /// The fullscreenchange event occurs when an element is viewed in fullscreen mode.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_fullscreenchange.asp)
    @discardableResult
    public func onFullScreenChange(_ handler: @escaping () -> Void) -> Self {
        onFullScreenChange { _ in handler() }
    }
}
