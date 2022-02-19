//
//  DragLeaveHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DragLeaveHandleable: DOMEventable {
    @discardableResult
    func onDragLeave(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DragLeaveContainer: Container<DragEvent>, StorageKey {
    typealias Value = DragLeaveContainer
}

extension DragLeaveHandleable {
    /// The ondragleave event occurs when a draggable element or text selection leaves a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragleave.asp)
    @discardableResult
    public func onDragLeave(_ handler: @escaping (Self, DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondragleave", createOrUpdate(DragLeaveContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The ondragleave event occurs when a draggable element or text selection leaves a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragleave.asp)
    @discardableResult
    public func onDragLeave(_ handler: @escaping (Self) -> Void) -> Self {
        onDragLeave { _,_ in handler(self) }
    }
    
    /// The ondragleave event occurs when a draggable element or text selection leaves a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragleave.asp)
    @discardableResult
    public func onDragLeave(_ handler: @escaping () -> Void) -> Self {
        onDragLeave { _ in handler() }
    }
}
