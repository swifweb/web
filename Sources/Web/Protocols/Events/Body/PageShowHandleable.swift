//
//  PageShowHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol PageShowHandleable {
    @discardableResult
    func onPageShow(_ handler: @escaping () -> Void) -> Self
}

protocol _PageShowHandleable: _AnyElement, PageShowHandleable {
    typealias PageShowClosure = JSClosure
    
    var pageShowClosure: PageShowClosure? { get set }
    var pageShowHandler: (PageTransitionEvent) -> Void { get set }
}

extension PageShowHandleable {
    /// The onpageshow event occurs when a user navigates to a webpage.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onpageshow.asp)
    @discardableResult
    public func onPageShow(_ handler: @escaping (PageTransitionEvent) -> Void) -> Self {
        guard let s = self as? _PageShowHandleable else { return self }
        s.pageShowClosure?.release()
        s.pageShowClosure = JSClosure { event in
            s.pageShowHandler(.init(event.jsValue()))
        }
        s.domElement.onpageshow = s.pageShowClosure.jsValue()
        s.pageShowHandler = handler
        return self
    }
    
    @discardableResult
    public func onPageShow(_ handler: @escaping () -> Void) -> Self {
        onPageShow { _ in handler() }
    }
}
