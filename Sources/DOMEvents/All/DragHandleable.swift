//
//  DragHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DragHandleable: DOMEventable {
    @discardableResult
    func onDrag(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DragContainer: Container<DragEvent>, StorageKey {
    typealias Value = DragContainer
}

extension DragHandleable {
    /// The ondrag event occurs when an element or text selection is being dragged.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrag.asp)
    @discardableResult
    public func onDrag(_ handler: @escaping (Self, DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondrag", createOrUpdate(DragContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The ondrag event occurs when an element or text selection is being dragged.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrag.asp)
    @discardableResult
    public func onDrag(_ handler: @escaping (Self) -> Void) -> Self {
        onDrag { _,_ in handler(self) }
    }
    
    /// The ondrag event occurs when an element or text selection is being dragged.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrag.asp)
    @discardableResult
    public func onDrag(_ handler: @escaping () -> Void) -> Self {
        onDrag { _ in handler() }
    }
}
