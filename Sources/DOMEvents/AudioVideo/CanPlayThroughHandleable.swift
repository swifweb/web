//
//  CanPlayThroughHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol CanPlayThroughHandleable: DOMEventable {
    @discardableResult
    func onCanPlayThrough(_ handler: @escaping () -> Void) -> Self
}

fileprivate class CanPlayThroughContainer: Container<Event>, StorageKey {
    typealias Value = CanPlayThroughContainer
}

extension CanPlayThroughHandleable {
    /// The oncanplaythrough event occurs when the browser estimates
    /// it can play through the specified media without having to stop for buffering.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncanplaythrough.asp)
    @discardableResult
    public func onCanPlayThrough(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("oncanplaythrough", createOrUpdate(CanPlayThroughContainer.self, handler))
    }
    
    @discardableResult
    public func onCanPlayThrough(_ handler: @escaping () -> Void) -> Self {
        onCanPlayThrough { _ in handler() }
    }
}
