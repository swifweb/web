//
//  ErrorHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ErrorHandleable {
    @discardableResult
    func onError(_ handler: @escaping () -> Void) -> Self
}

protocol _ErrorHandleable: _AnyElement, ErrorHandleable {
    typealias ErrorClosure = JSClosure
    
    var errorClosure: ErrorClosure? { get set }
    var errorHandler: (ProgressEvent) -> Void { get set }
}

extension ErrorHandleable {
    /// The onerror event is triggered if an error occurs while loading an external file (e.g. a document or an image).
    ///
    /// Applicable to `<img>`, `<input type="image">`, `<object>`, `<link>`, and `<script>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onerror.asp)
    @discardableResult
    public func onError(_ handler: @escaping (ProgressEvent) -> Void) -> Self {
        guard let s = self as? _ErrorHandleable else { return self }
        s.errorClosure?.release()
        s.errorClosure = JSClosure { event in
            s.errorHandler(.init(event.jsValue()))
        }
        s.domElement.onerror = s.errorClosure.jsValue()
        s.errorHandler = handler
        return self
    }
    
    @discardableResult
    public func onError(_ handler: @escaping () -> Void) -> Self {
        onError { _ in handler() }
    }
}
