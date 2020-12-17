//
//  DragEnterHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DragEnterHandleable {
    @discardableResult
    func onDragEnter(_ handler: @escaping () -> Void) -> Self
}

protocol _DragEnterHandleable: _AnyElement, DragEnterHandleable {
    typealias DragEnterClosure = JSClosure
    
    var dragEnterClosure: DragEnterClosure? { get set }
    var dragEnterHandler: (DragEvent) -> Void { get set }
}

extension DragEnterHandleable {
    /// The ondragenter event occurs when a draggable element or text selection enters a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragenter.asp)
    @discardableResult
    public func onDragEnter(_ handler: @escaping (DragEvent) -> Void) -> Self {
        guard let s = self as? _DragEnterHandleable else { return self }
        s.dragEnterClosure?.release()
        s.dragEnterClosure = JSClosure { event in
            s.dragEnterHandler(.init(event.jsValue()))
        }
        s.domElement.ondragenter = s.dragEnterClosure.jsValue()
        s.dragEnterHandler = handler
        return self
    }
    
    @discardableResult
    public func onDragEnter(_ handler: @escaping () -> Void) -> Self {
        onDragEnter { _ in handler() }
    }
}
