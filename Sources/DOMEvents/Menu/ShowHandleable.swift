//
//  ShowHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ShowHandleable: DOMEventable {
    @discardableResult
    func onShow(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ShowContainer: Container<Event>, StorageKey {
    typealias Value = ShowContainer
}

extension ShowHandleable {
    /// The `onshow` event occurs when a `<menu>` element is shown as a context menu.
    ///
    /// Applicable to `<menu>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onshow.asp)
    @discardableResult
    public func onShow(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onshow", createOrUpdate(ShowContainer.self, handler))
    }
    
    @discardableResult
    public func onShow(_ handler: @escaping () -> Void) -> Self {
        onShow { _ in handler() }
    }
}
