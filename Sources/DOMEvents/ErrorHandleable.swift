//
//  ErrorHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ErrorHandleable: DOMEventable {
    @discardableResult
    func onError(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ErrorContainer: Container<ProgressEvent>, StorageKey {
    typealias Value = ErrorContainer
}

extension ErrorHandleable {
    /// The onerror event is triggered if an error occurs while loading an external file (e.g. a document or an image).
    ///
    /// Applicable to `<img>`, `<input type="image">`, `<object>`, `<link>`, and `<script>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onerror.asp)
    @discardableResult
    public func onError(_ handler: @escaping (ProgressEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onerror", createOrUpdate(ErrorContainer.self, handler))
    }
    
    @discardableResult
    public func onError(_ handler: @escaping () -> Void) -> Self {
        onError { _ in handler() }
    }
}
