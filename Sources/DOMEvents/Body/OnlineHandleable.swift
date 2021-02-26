//
//  OnlineHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol OnlineHandleable: DOMEventable {
    @discardableResult
    func onOnline(_ handler: @escaping () -> Void) -> Self
}

fileprivate class OnlineContainer: Container<Event>, StorageKey {
    typealias Value = OnlineContainer
}

extension OnlineHandleable {
    /// The ononline event occurs when the browser starts to work online.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ononline.asp)
    @discardableResult
    public func onOnline(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("ononline", createOrUpdate(OnlineContainer.self, handler))
    }
    
    @discardableResult
    public func onOnline(_ handler: @escaping () -> Void) -> Self {
        onOnline { _ in handler() }
    }
}
