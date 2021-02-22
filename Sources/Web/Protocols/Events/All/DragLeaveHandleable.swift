//
//  DragLeaveHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DragLeaveHandleable {
    @discardableResult
    func onDragLeave(_ handler: @escaping () -> Void) -> Self
}

protocol _DragLeaveHandleable: _AnyElement, DragLeaveHandleable {
    typealias DragLeaveClosure = JSClosure
    
    var dragLeaveClosure: DragLeaveClosure? { get set }
    var dragLeaveHandler: (DragEvent) -> Void { get set }
}

extension DragLeaveHandleable {
    /// The ondragleave event occurs when a draggable element or text selection leaves a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondragleave.asp)
    @discardableResult
    public func onDragLeave(_ handler: @escaping (DragEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _DragLeaveHandleable else { return self }
        s.dragLeaveClosure?.release()
        s.dragLeaveClosure = JSClosure { event in
            s.dragLeaveHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.ondragleave = s.dragLeaveClosure.jsValue()
        s.dragLeaveHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onDragLeave(_ handler: @escaping () -> Void) -> Self {
        onDragLeave { _ in handler() }
    }
}
