//
//  AfterPrintHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AfterPrintHandleable: DOMEventable {
    @discardableResult
    func onAfterPrint(_ handler: @escaping () -> Void) -> Self
}

fileprivate class AfterPrintContainer: Container<Event>, StorageKey {
    typealias Value = AfterPrintContainer
}

extension AfterPrintHandleable {
    /// The onafterprint event occurs when a page has started printing, or if the print dialogue box has been closed.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onafterprint.asp)
    @discardableResult
    public func onAfterPrint(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onafterprint", createOrUpdate(AfterPrintContainer.self, handler))
    }
    
    @discardableResult
    public func onAfterPrint(_ handler: @escaping () -> Void) -> Self {
        onAfterPrint { _ in handler() }
    }
}
