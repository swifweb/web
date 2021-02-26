//
//  LoadStartHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol LoadStartHandleable: DOMEventable {
    @discardableResult
    func onLoadStart(_ handler: @escaping () -> Void) -> Self
}

fileprivate class LoadStartContainer: Container<ProgressEvent>, StorageKey {
    typealias Value = LoadStartContainer
}

extension LoadStartHandleable {
    /// The onloadstart event occurs when the browser starts looking for the specified audio/video.
    /// This is when the loading process starts.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onloadstart.asp)
    @discardableResult
    public func onLoadStart(_ handler: @escaping (ProgressEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onloadstart", createOrUpdate(LoadStartContainer.self, handler))
    }
    
    @discardableResult
    public func onLoadStart(_ handler: @escaping () -> Void) -> Self {
        onLoadStart { _ in handler() }
    }
}
