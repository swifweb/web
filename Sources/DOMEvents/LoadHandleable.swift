//
//  LoadHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol LoadHandleable: DOMEventable {
    @discardableResult
    func onLoad(_ handler: @escaping () -> Void) -> Self
}

fileprivate class LoadContainer: Container<UIEvent>, StorageKey {
    typealias Value = LoadContainer
}

extension LoadHandleable {
    /// The onload event occurs when an object has been loaded.
    ///
    /// Applicable to `<body>`, `<frame>`, `<iframe>`, `<img>`, `<input type="image">`, `<link>`, `<script>`, `<style>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onload.asp)
    @discardableResult
    public func onLoad(_ handler: @escaping (UIEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onload", createOrUpdate(LoadContainer.self, handler))
    }
    
    @discardableResult
    public func onLoad(_ handler: @escaping () -> Void) -> Self {
        onLoad { _ in handler() }
    }
}
