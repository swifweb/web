//
//  PageHideHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PageHideHandleable {
    @discardableResult
    func onPageHide(_ handler: @escaping () -> Void) -> Self
}

protocol _PageHideHandleable: _AnyElement, PageHideHandleable {
    typealias PageHideClosure = JSClosure
    
    var pageHideClosure: PageHideClosure? { get set }
    var pageHideHandler: (PageTransitionEvent) -> Void { get set }
}

extension PageHideHandleable {
    /// The onpagehide event occurs when the user is navigating away from a webpage.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpagehide.asp)
    @discardableResult
    public func onPageHide(_ handler: @escaping (PageTransitionEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _PageHideHandleable else { return self }
        s.pageHideClosure?.release()
        s.pageHideClosure = JSClosure { event in
            s.pageHideHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onpagehide = s.pageHideClosure.jsValue()
        s.pageHideHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onPageHide(_ handler: @escaping () -> Void) -> Self {
        onPageHide { _ in handler() }
    }
}
