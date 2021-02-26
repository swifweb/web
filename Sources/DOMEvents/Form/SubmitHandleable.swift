//
//  SubmitHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SubmitHandleable: DOMEventable {
    @discardableResult
    func onSubmit(_ handler: @escaping () -> Void) -> Self
}

fileprivate class SubmitContainer: Container<Event>, StorageKey {
    typealias Value = SubmitContainer
}

extension SubmitHandleable {
    /// The onsubmit event occurs when a form is submitted.
    ///
    /// Applicable to `<form>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onsubmit.asp)
    @discardableResult
    public func onSubmit(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onsubmit", createOrUpdate(SubmitContainer.self, handler))
    }
    
    @discardableResult
    public func onSubmit(_ handler: @escaping () -> Void) -> Self {
        onSubmit { _ in handler() }
    }
    
    public func submit() {
        callFunction("submit")
    }
}
