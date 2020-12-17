//
//  DragStartHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DragStartHandleable {
    @discardableResult
    func onDragStart(_ handler: @escaping () -> Void) -> Self
}

protocol _DragStartHandleable: _AnyElement, DragStartHandleable {
    typealias DragStartClosure = JSClosure
    
    var dragStartClosure: DragStartClosure? { get set }
    var dragStartHandler: (DragEvent) -> Void { get set }
}

extension DragStartHandleable {
    /// The ondragstart event occurs when the user starts to drag an element or text selection.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragstart.asp)
    @discardableResult
    public func onDragStart(_ handler: @escaping (DragEvent) -> Void) -> Self {
        guard let s = self as? _DragStartHandleable else { return self }
        s.dragStartClosure?.release()
        s.dragStartClosure = JSClosure { event in
            s.dragStartHandler(.init(event.jsValue()))
        }
        s.domElement.ondragstart = s.dragStartClosure.jsValue()
        s.dragStartHandler = handler
        return self
    }
    
    @discardableResult
    public func onDragStart(_ handler: @escaping () -> Void) -> Self {
        onDragStart { _ in handler() }
    }
}
