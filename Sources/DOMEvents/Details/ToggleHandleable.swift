//
//  ToggleHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ToggleHandleable: DOMEventable {
    @discardableResult
    func onToggle(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ToggleContainer: Container<Event>, StorageKey {
    typealias Value = ToggleContainer
}

extension ToggleHandleable {
    /// The `ontoggle` event occurs when the user opens or closes the `<details>` element.
    ///
    /// Applicable to `<details>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ontoggle.asp)
    @discardableResult
    public func onToggle(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("ontoggle", createOrUpdate(ToggleContainer.self, handler))
    }
    
    @discardableResult
    public func onToggle(_ handler: @escaping () -> Void) -> Self {
        onToggle { _ in handler() }
    }
}
