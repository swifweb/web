//
//  UnloadHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol UnloadHandleable {
    @discardableResult
    func onUnload(_ handler: @escaping () -> Void) -> Self
}

protocol _UnloadHandleable: _AnyElement, UnloadHandleable {
    typealias UnloadClosure = JSClosure
    
    var unloadClosure: UnloadClosure? { get set }
    var unloadHandler: (UIEvent) -> Void { get set }
}

extension UnloadHandleable {
    /// The onunload event occurs once a page has unloaded (or the browser window has been closed).
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onunload.asp)
    @discardableResult
    public func onUnload(_ handler: @escaping (UIEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _UnloadHandleable else { return self }
        s.unloadClosure?.release()
        s.unloadClosure = JSClosure { event in
            s.unloadHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onunload = s.unloadClosure.jsValue()
        s.unloadHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onUnload(_ handler: @escaping () -> Void) -> Self {
        onUnload { _ in handler() }
    }
}
