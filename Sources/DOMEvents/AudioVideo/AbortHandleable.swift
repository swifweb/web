//
//  AbortHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol AbortHandleable: DOMEventable {
    @discardableResult
    func onAbort(_ handler: @escaping () -> Void) -> Self
}

fileprivate class AbortContainer: Container<UIEvent>, StorageKey {
    typealias Value = AbortContainer
}

extension AbortHandleable {
    /// The onabort event occurs when the loading of an audio/video is aborted.
    ///
    /// This event occurs when the media data download has been aborted, and not because of an error.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onabort_media.asp)
    @discardableResult
    public func onAbort(_ handler: @escaping (UIEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onabort", createOrUpdate(AbortContainer.self, handler))
    }
    
    @discardableResult
    public func onAbort(_ handler: @escaping () -> Void) -> Self {
        onAbort { _ in handler() }
    }
}
