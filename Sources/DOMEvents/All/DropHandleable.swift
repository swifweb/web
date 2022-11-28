//
//  DropHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DropHandleable: DOMEventable {
    @discardableResult
    func onDrop(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DropContainer: Container<DragEvent>, StorageKey {
    typealias Value = DropContainer
}

extension DropHandleable {
    /// The ondrop event occurs when a draggable element or text selection is dropped on a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrop.asp)
    @discardableResult
    public func onDrop(_ handler: @escaping (Self, DragEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondrop", createOrUpdate(DropContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The ondrop event occurs when a draggable element or text selection is dropped on a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrop.asp)
    @discardableResult
    public func onDrop(_ handler: @escaping (Self) -> Void) -> Self {
        onDrop { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The ondrop event occurs when a draggable element or text selection is dropped on a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrop.asp)
    @discardableResult
    public func onDrop(_ handler: @escaping () -> Void) -> Self {
        onDrop { _ in handler() }
    }
}
