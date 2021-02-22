//
//  BeforePrintHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol BeforePrintHandleable {
    @discardableResult
    func onBeforePrint(_ handler: @escaping () -> Void) -> Self
}

protocol _BeforePrintHandleable: _AnyElement, BeforePrintHandleable {
    typealias BeforePrintClosure = JSClosure
    
    var beforePrintClosure: BeforePrintClosure? { get set }
    var beforePrintHandler: (HandledEvent) -> Void { get set }
}

extension BeforePrintHandleable {
    /// The onbeforeprint event occurs when a page is about to be printed (before the print dialogue box appears).
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onbeforeprint.asp)
    @discardableResult
    public func onBeforePrint(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _BeforePrintHandleable else { return self }
        s.beforePrintClosure?.release()
        s.beforePrintClosure = JSClosure { event in
            s.beforePrintHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onbeforeprint = s.beforePrintClosure.jsValue()
        s.beforePrintHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onBeforePrint(_ handler: @escaping () -> Void) -> Self {
        onBeforePrint { _ in handler() }
    }
}
