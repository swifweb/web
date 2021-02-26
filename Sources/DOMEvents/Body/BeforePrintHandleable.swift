//
//  BeforePrintHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol BeforePrintHandleable: DOMEventable {
    @discardableResult
    func onBeforePrint(_ handler: @escaping () -> Void) -> Self
}

fileprivate class BeforePrintContainer: Container<Event>, StorageKey {
    typealias Value = BeforePrintContainer
}

extension BeforePrintHandleable {
    /// The onbeforeprint event occurs when a page is about to be printed (before the print dialogue box appears).
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onbeforeprint.asp)
    @discardableResult
    public func onBeforePrint(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onbeforeprint", createOrUpdate(BeforePrintContainer.self, handler))
    }
    
    @discardableResult
    public func onBeforePrint(_ handler: @escaping () -> Void) -> Self {
        onBeforePrint { _ in handler() }
    }
}
