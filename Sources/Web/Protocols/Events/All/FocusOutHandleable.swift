//
//  FocusOutHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol FocusOutHandleable {
    @discardableResult
    func onFocusOut(_ handler: @escaping () -> Void) -> Self
}

protocol _FocusOutHandleable: _AnyElement, FocusOutHandleable {
    typealias FocusOutClosure = JSClosure
    
    var focusOutClosure: FocusOutClosure? { get set }
    var focusOutHandler: (FocusEvent) -> Void { get set }
}

extension FocusOutHandleable {
    /// The onfocusout event occurs when an element is about to lose focus.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusout.asp)
    @discardableResult
    public func onFocusOut(_ handler: @escaping (FocusEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _FocusOutHandleable else { return self }
        s.focusOutClosure?.release()
        s.focusOutClosure = JSClosure { event in
            s.focusOutHandler(.init(event.jsValue()))
        }
        s.domElement.onfocusout = s.focusOutClosure.jsValue()
        s.focusOutHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onFocusOut(_ handler: @escaping () -> Void) -> Self {
        onFocusOut { _ in handler() }
    }
}
