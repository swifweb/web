//
//  BeforeUnloadHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol BeforeUnloadHandleable: DOMEventable {
    @discardableResult
    func onBeforeUnload(_ handler: @escaping () -> Void) -> Self
}

fileprivate class BeforeUnloadContainer: Container<UIEvent>, StorageKey {
    typealias Value = BeforeUnloadContainer
}

extension BeforeUnloadHandleable {
    /// The onbeforeunload event occurs when the document is about to be unloaded.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onbeforeunload.asp)
    @discardableResult
    public func onBeforeUnload(_ handler: @escaping (UIEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onbeforeunload", createOrUpdate(BeforeUnloadContainer.self, handler))
    }
    
    @discardableResult
    public func onBeforeUnload(_ handler: @escaping () -> Void) -> Self {
        onBeforeUnload { _ in handler() }
    }
}
