//
//  DragEnterHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DragEnterHandleable: DOMEventable {
    @discardableResult
    func onDragEnter(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DragEnterContainer: Container<DragEvent>, StorageKey {
    typealias Value = DragEnterContainer
}

extension DragEnterHandleable {
    /// The ondragenter event occurs when a draggable element or text selection enters a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragenter.asp)
    @discardableResult
    public func onDragEnter(_ handler: @escaping (DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondragenter", createOrUpdate(DragEnterContainer.self, handler))
    }
    
    @discardableResult
    public func onDragEnter(_ handler: @escaping () -> Void) -> Self {
        onDragEnter { _ in handler() }
    }
}
