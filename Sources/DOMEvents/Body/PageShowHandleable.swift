//
//  PageShowHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PageShowHandleable: DOMEventable {
    @discardableResult
    func onPageShow(_ handler: @escaping () -> Void) -> Self
}

fileprivate class PageShowContainer: Container<PageTransitionEvent>, StorageKey {
    typealias Value = PageShowContainer
}

extension PageShowHandleable {
    /// The onpageshow event occurs when a user navigates to a webpage.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpageshow.asp)
    @discardableResult
    public func onPageShow(_ handler: @escaping (PageTransitionEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onpageshow", createOrUpdate(PageShowContainer.self, handler))
    }
    
    @discardableResult
    public func onPageShow(_ handler: @escaping () -> Void) -> Self {
        onPageShow { _ in handler() }
    }
}
