//
//  DragEndHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DragEndHandleable: DOMEventable {
    @discardableResult
    func onDragEnd(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DragEndContainer: Container<DragEvent>, StorageKey {
    typealias Value = DragEndContainer
}

extension DragEndHandleable {
    /// The ondragend event occurs when the user has finished dragging an element or text selection.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragend.asp)
    @discardableResult
    public func onDragEnd(_ handler: @escaping (DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondragend", createOrUpdate(DragEndContainer.self, handler))
    }
    
    @discardableResult
    public func onDragEnd(_ handler: @escaping () -> Void) -> Self {
        onDragEnd { _ in handler() }
    }
}
