//
//  SeekedHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol SeekedHandleable: DOMEventable {
    @discardableResult
    func onSeeked(_ handler: @escaping () -> Void) -> Self
}

fileprivate class SeekedContainer: Container<Event>, StorageKey {
    typealias Value = SeekedContainer
}

extension SeekedHandleable {
    /// The onseeked event occurs when the user is finished moving/skipping to a new position in the audio/video
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onseeked.asp)
    @discardableResult
    public func onSeeked(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onseeked", createOrUpdate(SeekedContainer.self, handler))
    }
    
    @discardableResult
    public func onSeeked(_ handler: @escaping () -> Void) -> Self {
        onSeeked { _ in handler() }
    }
}
