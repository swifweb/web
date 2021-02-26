//
//  UnloadHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol UnloadHandleable: DOMEventable {
    @discardableResult
    func onUnload(_ handler: @escaping () -> Void) -> Self
}

fileprivate class UnloadContainer: Container<UIEvent>, StorageKey {
    typealias Value = UnloadContainer
}

extension UnloadHandleable {
    /// The onunload event occurs once a page has unloaded (or the browser window has been closed).
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onunload.asp)
    @discardableResult
    public func onUnload(_ handler: @escaping (UIEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onunload", createOrUpdate(UnloadContainer.self, handler))
    }
    
    @discardableResult
    public func onUnload(_ handler: @escaping () -> Void) -> Self {
        onUnload { _ in handler() }
    }
}
