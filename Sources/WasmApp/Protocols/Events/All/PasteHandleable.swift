//
//  PasteHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PasteHandleable {
    @discardableResult
    func onPaste(_ handler: @escaping () -> Void) -> Self
}

protocol _PasteHandleable: _AnyElement, PasteHandleable {
    typealias PasteClosure = JSClosure
    
    var pasteClosure: PasteClosure? { get set }
    var pasteHandler: (ClipboardEvent) -> Void { get set }
}

extension PasteHandleable {
    /// The onpaste event occurs when the user pastes some content in an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpaste.asp)
    @discardableResult
    public func onPaste(_ handler: @escaping (ClipboardEvent) -> Void) -> Self {
        guard let s = self as? _PasteHandleable else { return self }
        s.pasteClosure?.release()
        s.pasteClosure = JSClosure { event in
            s.pasteHandler(.init(event.jsValue()))
        }
        s.domElement.onpaste = s.pasteClosure.jsValue()
        s.pasteHandler = handler
        return self
    }
    
    @discardableResult
    public func onPaste(_ handler: @escaping () -> Void) -> Self {
        onPaste { _ in handler() }
    }
}
