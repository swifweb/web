//
//  EndedHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol EndedHandleable: DOMEventable {
    @discardableResult
    func onEnded(_ handler: @escaping () -> Void) -> Self
}

fileprivate class EndedContainer: Container<Event>, StorageKey {
    typealias Value = EndedContainer
}

extension EndedHandleable {
    /// The onended event occurs when the audio/video has reached the end.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onended.asp)
    @discardableResult
    public func onEnded(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onended", createOrUpdate(EndedContainer.self, handler))
    }
    
    @discardableResult
    public func onEnded(_ handler: @escaping () -> Void) -> Self {
        onEnded { _ in handler() }
    }
}
