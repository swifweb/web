//
//  DragOverHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DragOverHandleable {
    @discardableResult
    func onDragOver(_ handler: @escaping () -> Void) -> Self
}

protocol _DragOverHandleable: _AnyElement, DragOverHandleable {
    typealias DragOverClosure = JSClosure
    
    var dragOverClosure: DragOverClosure? { get set }
    var dragOverHandler: (DragEvent) -> Void { get set }
}

extension DragOverHandleable {
    /// The ondragover event occurs when a draggable element or text selection is being dragged over a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragover.asp)
    @discardableResult
    public func onDragOver(_ handler: @escaping (DragEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _DragOverHandleable else { return self }
        s.dragOverClosure?.release()
        s.dragOverClosure = JSClosure { event in
            s.dragOverHandler(.init(event.jsValue()))
        }
        s.domElement.ondragover = s.dragOverClosure.jsValue()
        s.dragOverHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onDragOver(_ handler: @escaping () -> Void) -> Self {
        onDragOver { _ in handler() }
    }
}
