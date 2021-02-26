//
//  PageHideHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PageHideHandleable: DOMEventable {
    @discardableResult
    func onPageHide(_ handler: @escaping () -> Void) -> Self
}

fileprivate class PageHideContainer: Container<PageTransitionEvent>, StorageKey {
    typealias Value = PageHideContainer
}

extension PageHideHandleable {
    /// The onpagehide event occurs when the user is navigating away from a webpage.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpagehide.asp)
    @discardableResult
    public func onPageHide(_ handler: @escaping (PageTransitionEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onpagehide", createOrUpdate(PageHideContainer.self, handler))
    }
    
    @discardableResult
    public func onPageHide(_ handler: @escaping () -> Void) -> Self {
        onPageHide { _ in handler() }
    }
}
