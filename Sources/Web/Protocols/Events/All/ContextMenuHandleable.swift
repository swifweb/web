//
//  ContextMenuHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ContextMenuHandleable {
    @discardableResult
    func onContextMenu(_ handler: @escaping () -> Void) -> Self
}

protocol _ContextMenuHandleable: _AnyElement, ContextMenuHandleable {
    typealias ContextMenuClosure = JSClosure
    
    var contextMenuClosure: ContextMenuClosure? { get set }
    var contextMenuHandler: (MouseEvent) -> Void { get set }
}

extension ContextMenuHandleable {
    /// The oncontextmenu event occurs when the user right-clicks on an element to open the context menu.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncontextmenu.asp)
    @discardableResult
    public func onContextMenu(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _ContextMenuHandleable else { return self }
        s.contextMenuClosure?.release()
        s.contextMenuClosure = JSClosure { event in
            s.contextMenuHandler(.init(event.jsValue()))
        }
        s.domElement.oncontextmenu = s.contextMenuClosure.jsValue()
        s.contextMenuHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onContextMenu(_ handler: @escaping () -> Void) -> Self {
        onContextMenu { _ in handler() }
    }
}
