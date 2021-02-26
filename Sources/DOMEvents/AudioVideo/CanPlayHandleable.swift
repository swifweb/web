//
//  CanPlayHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol CanPlayHandleable: DOMEventable {
    @discardableResult
    func onCanPlay(_ handler: @escaping () -> Void) -> Self
}

fileprivate class CanPlayContainer: Container<Event>, StorageKey {
    typealias Value = CanPlayContainer
}

extension CanPlayHandleable {
    /// The oncanplay event occurs when the browser can start playing the specified audio/video (when it has buffered enough to begin).
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncanplay.asp)
    @discardableResult
    public func onCanPlay(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("oncanplay", createOrUpdate(CanPlayContainer.self, handler))
    }
    
    @discardableResult
    public func onCanPlay(_ handler: @escaping () -> Void) -> Self {
        onCanPlay { _ in handler() }
    }
}
