//
//  DropHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DropHandleable {
    @discardableResult
    func onDrop(_ handler: @escaping () -> Void) -> Self
}

protocol _DropHandleable: _AnyElement, DropHandleable {
    typealias DropClosure = JSClosure
    
    var dropClosure: DropClosure? { get set }
    var dropHandler: (DragEvent) -> Void { get set }
}

extension DropHandleable {
    /// The ondrop event occurs when a draggable element or text selection is dropped on a valid drop target.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondrop.asp)
    @discardableResult
    public func onDrop(_ handler: @escaping (DragEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _DropHandleable else { return self }
        s.dropClosure?.release()
        s.dropClosure = JSClosure { event in
            s.dropHandler(.init(event.jsValue()))
        }
        s.domElement.ondrop = s.dropClosure.jsValue()
        s.dropHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onDrop(_ handler: @escaping () -> Void) -> Self {
        onDrop { _ in handler() }
    }
}
