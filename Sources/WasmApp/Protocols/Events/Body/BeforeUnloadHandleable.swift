//
//  BeforeUnloadHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol BeforeUnloadHandleable {
    @discardableResult
    func onBeforeUnload(_ handler: @escaping () -> Void) -> Self
}

protocol _BeforeUnloadHandleable: _AnyElement, BeforeUnloadHandleable {
    typealias BeforeUnloadClosure = JSClosure
    
    var beforeUnloadClosure: BeforeUnloadClosure? { get set }
    var beforeUnloadHandler: (UIEvent) -> Void { get set }
}

extension BeforeUnloadHandleable {
    /// The onbeforeunload event occurs when the document is about to be unloaded.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onbeforeunload.asp)
    @discardableResult
    public func onBeforeUnload(_ handler: @escaping (UIEvent) -> Void) -> Self {
        guard let s = self as? _BeforeUnloadHandleable else { return self }
        s.beforeUnloadClosure?.release()
        s.beforeUnloadClosure = JSClosure { event in
            s.beforeUnloadHandler(.init(event.jsValue()))
        }
        s.domElement.onbeforeunload = s.beforeUnloadClosure.jsValue()
        s.beforeUnloadHandler = handler
        return self
    }
    
    @discardableResult
    public func onBeforeUnload(_ handler: @escaping () -> Void) -> Self {
        onBeforeUnload { _ in handler() }
    }
}
