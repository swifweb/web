//
//  DragHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DragHandleable {
    @discardableResult
    func onDrag(_ handler: @escaping () -> Void) -> Self
}

protocol _DragHandleable: _AnyElement, DragHandleable {
    typealias DragClosure = JSClosure
    
    var dragClosure: DragClosure? { get set }
    var dragHandler: (DragEvent) -> Void { get set }
}

extension DragHandleable {
    /// The ondrag event occurs when an element or text selection is being dragged.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrag.asp)
    @discardableResult
    public func onDrag(_ handler: @escaping (DragEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _DragHandleable else { return self }
        s.dragClosure?.release()
        s.dragClosure = JSClosure { event in
            s.dragHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.ondrag = s.dragClosure.jsValue()
        s.dragHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onDrag(_ handler: @escaping () -> Void) -> Self {
        onDrag { _ in handler() }
    }
}
