//
//  FocusInHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol FocusInHandleable {
    @discardableResult
    func onFocusIn(_ handler: @escaping () -> Void) -> Self
}

protocol _FocusInHandleable: _AnyElement, FocusInHandleable {
    typealias FocusInClosure = JSClosure
    
    var focusInClosure: FocusInClosure? { get set }
    var focusInHandler: (FocusEvent) -> Void { get set }
}

extension FocusInHandleable {
    /// The onfocusin event occurs when an element is about to get focus.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusin.asp)
    @discardableResult
    public func onFocusIn(_ handler: @escaping (FocusEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _FocusInHandleable else { return self }
        s.focusInClosure?.release()
        s.focusInClosure = JSClosure { event in
            s.focusInHandler(.init(event.jsValue()))
        }
        s.domElement.onfocusin = s.focusInClosure.jsValue()
        s.focusInHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onFocusIn(_ handler: @escaping () -> Void) -> Self {
        onFocusIn { _ in handler() }
    }
}
