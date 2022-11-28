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
    public func onContextMenu(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("oncontextmenu", createOrUpdate(ContextMenuContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The oncontextmenu event occurs when the user right-clicks on an element to open the context menu.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncontextmenu.asp)
    @discardableResult
    public func onContextMenu(_ handler: @escaping (Self) -> Void) -> Self {
        onContextMenu { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The oncontextmenu event occurs when the user right-clicks on an element to open the context menu.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncontextmenu.asp)
    @discardableResult
    public func onContextMenu(_ handler: @escaping () -> Void) -> Self {
        onContextMenu { _ in handler() }
    }
}
