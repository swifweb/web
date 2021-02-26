//
//  OfflineHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol OfflineHandleable: DOMEventable {
    @discardableResult
    func onOffline(_ handler: @escaping () -> Void) -> Self
}

fileprivate class OfflineContainer: Container<Event>, StorageKey {
    typealias Value = OfflineContainer
}

extension OfflineHandleable {
    /// The onoffline event occurs when the browser starts to work offline.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onoffline.asp)
    @discardableResult
    public func onOffline(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onoffline", createOrUpdate(OfflineContainer.self, handler))
    }
    
    @discardableResult
    public func onOffline(_ handler: @escaping () -> Void) -> Self {
        onOffline { _ in handler() }
    }
}
