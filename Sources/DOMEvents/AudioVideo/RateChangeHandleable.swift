//
//  RateChangeHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol RateChangeHandleable: DOMEventable {
    @discardableResult
    func onRateChange(_ handler: @escaping () -> Void) -> Self
}

fileprivate class RateChangeContainer: Container<Event>, StorageKey {
    typealias Value = RateChangeContainer
}

extension RateChangeHandleable {
    /// The `onratechange` event occurs when the playing speed of the audio/video is changed (like when a user switches to a slow motion or fast forward mode).
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onratechange.asp)
    @discardableResult
    public func onRateChange(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onratechange", createOrUpdate(RateChangeContainer.self, handler))
    }
    
    @discardableResult
    public func onRateChange(_ handler: @escaping () -> Void) -> Self {
        onRateChange { _ in handler() }
    }
}
