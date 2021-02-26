//
//  ResetHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ResetHandleable: DOMEventable {
    @discardableResult
    func onReset(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ResetContainer: Container<Event>, StorageKey {
    typealias Value = ResetContainer
}

extension ResetHandleable {
    /// The onreset event occurs when a form is reset.
    ///
    /// Applicable to `<form>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onreset.asp)
    @discardableResult
    public func onReset(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onreset", createOrUpdate(ResetContainer.self, handler))
    }
    
    @discardableResult
    public func onReset(_ handler: @escaping () -> Void) -> Self {
        onReset { _ in handler() }
    }
    
    public func reset() {
        callFunction("reset")
    }
}
