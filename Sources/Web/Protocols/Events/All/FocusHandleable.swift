//
//  FocusHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol FocusHandleable {
    @discardableResult
    func onFocus(_ handler: @escaping () -> Void) -> Self
}

protocol _FocusHandleable: _AnyElement, FocusHandleable {
    typealias FocusClosure = JSClosure
    
    var focusClosure: FocusClosure? { get set }
    var focusHandler: (FocusEvent) -> Void { get set }
}

extension FocusHandleable {
    /// The onfocus event occurs when an element gets focus.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocus.asp)
    @discardableResult
    public func onFocus(_ handler: @escaping (FocusEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _FocusHandleable else { return self }
        s.focusClosure?.release()
        s.focusClosure = JSClosure { event in
            s.focusHandler(.init(event.jsValue()))
        }
        s.domElement.onfocus = s.focusClosure.jsValue()
        s.focusHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onFocus(_ handler: @escaping () -> Void) -> Self {
        onFocus { _ in handler() }
    }
}
