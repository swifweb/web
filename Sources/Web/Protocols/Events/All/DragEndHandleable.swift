//
//  DragEndHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DragEndHandleable {
    @discardableResult
    func onDragEnd(_ handler: @escaping () -> Void) -> Self
}

protocol _DragEndHandleable: _AnyElement, DragEndHandleable {
    typealias DragEndClosure = JSClosure
    
    var dragEndClosure: DragEndClosure? { get set }
    var dragEndHandler: (DragEvent) -> Void { get set }
}

extension DragEndHandleable {
    /// The ondragend event occurs when the user has finished dragging an element or text selection.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragend.asp)
    @discardableResult
    public func onDragEnd(_ handler: @escaping (DragEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _DragEndHandleable else { return self }
        s.dragEndClosure?.release()
        s.dragEndClosure = JSClosure { event in
            s.dragEndHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.ondragend = s.dragEndClosure.jsValue()
        s.dragEndHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onDragEnd(_ handler: @escaping () -> Void) -> Self {
        onDragEnd { _ in handler() }
    }
}
