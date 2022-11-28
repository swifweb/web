//
//  DragOverHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DragOverHandleable: DOMEventable {
    @discardableResult
    func onDragOver(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DragOverContainer: Container<DragEvent>, StorageKey {
    typealias Value = DragOverContainer
}

extension DragOverHandleable {
    /// The ondragover event occurs when a draggable element or text selection is being dragged over a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragover.asp)
    @discardableResult
    public func onDragOver(_ handler: @escaping (Self, DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondragover", createOrUpdate(DragOverContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The ondragover event occurs when a draggable element or text selection is being dragged over a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragover.asp)
    @discardableResult
    public func onDragOver(_ handler: @escaping (Self) -> Void) -> Self {
        onDragOver { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The ondragover event occurs when a draggable element or text selection is being dragged over a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragover.asp)
    @discardableResult
    public func onDragOver(_ handler: @escaping () -> Void) -> Self {
        onDragOver { _ in handler() }
    }
}
