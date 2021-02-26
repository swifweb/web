//
//  HashChangeHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol HashChangeHandleable: DOMEventable {
    @discardableResult
    func onHashChange(_ handler: @escaping () -> Void) -> Self
}

fileprivate class HashChangeContainer: Container<HashChangeEvent>, StorageKey {
    typealias Value = HashChangeContainer
}

extension HashChangeHandleable {
    /// The onhashchange event occurs when there has been changes to the anchor part (begins with a '#' symbol) of the current URL.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onhashchange.asp)
    @discardableResult
    public func onHashChange(_ handler: @escaping (HashChangeEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onhashchange", createOrUpdate(HashChangeContainer.self, handler))
    }
    
    @discardableResult
    public func onHashChange(_ handler: @escaping () -> Void) -> Self {
        onHashChange { _ in handler() }
    }
}
