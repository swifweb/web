//
//  ProgressHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol ProgressHandleable: DOMEventable {
    @discardableResult
    func onProgress(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ProgressContainer: Container<Event>, StorageKey {
    typealias Value = ProgressContainer
}

extension ProgressHandleable {
    /// The onprogress event occurs when the browser is downloading the specified audio/video.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onprogress.asp)
    @discardableResult
    public func onProgress(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onprogress", createOrUpdate(ProgressContainer.self, handler))
    }
    
    @discardableResult
    public func onProgress(_ handler: @escaping () -> Void) -> Self {
        onProgress { _ in handler() }
    }
}
