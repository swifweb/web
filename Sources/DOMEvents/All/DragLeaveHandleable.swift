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
    public func onDragLeave(_ handler: @escaping (DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondragleave", createOrUpdate(DragLeaveContainer.self, handler))
    }
    
    @discardableResult
    public func onDragLeave(_ handler: @escaping () -> Void) -> Self {
        onDragLeave { _ in handler() }
    }
}
