//
//  ContextMenuHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol ContextMenuHandleable: DOMEventable {
    @discardableResult
    func onContextMenu(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ContextMenuContainer: Container<MouseEvent>, StorageKey {
    typealias Value = ContextMenuContainer
}

extension ContextMenuHandleable {
    /// The oncontextmenu event occurs when the user right-clicks on an element to open the context menu.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncontextmenu.asp)
    @discardableResult
    public func onContextMenu(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("oncontextmenu", createOrUpdate(ContextMenuContainer.self, handler))
    }
    
    @discardableResult
    public func onContextMenu(_ handler: @escaping () -> Void) -> Self {
        onContextMenu { _ in handler() }
    }
}
