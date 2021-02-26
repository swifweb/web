//
//  DragStartHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DragStartHandleable: DOMEventable {
    @discardableResult
    func onDragStart(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DragStartContainer: Container<DragEvent>, StorageKey {
    typealias Value = DragStartContainer
}

extension DragStartHandleable {
    /// The ondragstart event occurs when the user starts to drag an element or text selection.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragstart.asp)
    @discardableResult
    public func onDragStart(_ handler: @escaping (DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondragstart", createOrUpdate(DragStartContainer.self, handler))
    }
    
    @discardableResult
    public func onDragStart(_ handler: @escaping () -> Void) -> Self {
        onDragStart { _ in handler() }
    }
}
