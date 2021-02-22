//
//  LoadHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol LoadHandleable {
    @discardableResult
    func onLoad(_ handler: @escaping () -> Void) -> Self
}

protocol _LoadHandleable: _AnyElement, LoadHandleable {
    typealias LoadClosure = JSClosure
    
    var loadClosure: LoadClosure? { get set }
    var loadHandler: (UIEvent) -> Void { get set }
}

extension LoadHandleable {
    /// The onload event occurs when an object has been loaded.
    ///
    /// Applicable to <body>, <frame>, <iframe>, <img>, <input type="image">, <link>, <script>, <style>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onload.asp)
    @discardableResult
    public func onLoad(_ handler: @escaping (UIEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _LoadHandleable else { return self }
        s.loadClosure?.release()
        s.loadClosure = JSClosure { event in
            s.loadHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onload = s.loadClosure.jsValue()
        s.loadHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onLoad(_ handler: @escaping () -> Void) -> Self {
        onLoad { _ in handler() }
    }
}
