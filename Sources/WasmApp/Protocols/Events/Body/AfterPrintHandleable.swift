//
//  AfterPrintHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AfterPrintHandleable {
    @discardableResult
    func onAfterPrint(_ handler: @escaping () -> Void) -> Self
}

protocol _AfterPrintHandleable: _AnyElement, AfterPrintHandleable {
    typealias AfterPrintClosure = JSClosure
    
    var afterPrintClosure: AfterPrintClosure? { get set }
    var afterPrintHandler: (HandledEvent) -> Void { get set }
}

extension AfterPrintHandleable {
    /// The onafterprint event occurs when a page has started printing, or if the print dialogue box has been closed.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onafterprint.asp)
    @discardableResult
    public func onAfterPrint(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _AfterPrintHandleable else { return self }
        s.afterPrintClosure?.release()
        s.afterPrintClosure = JSClosure { event in
            s.afterPrintHandler(.init(event.jsValue()))
        }
        s.domElement.onafterprint = s.afterPrintClosure.jsValue()
        s.afterPrintHandler = handler
        return self
    }
    
    @discardableResult
    public func onAfterPrint(_ handler: @escaping () -> Void) -> Self {
        onAfterPrint { _ in handler() }
    }
}
