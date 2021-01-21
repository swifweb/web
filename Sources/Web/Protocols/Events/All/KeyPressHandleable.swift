//
//  KeyPressHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol KeyPressHandleable {
    @discardableResult
    func onKeyPress(_ handler: @escaping () -> Void) -> Self
}

protocol _KeyPressHandleable: _AnyElement, KeyPressHandleable {
    typealias KeyPressClosure = JSClosure
    
    var keyPressClosure: KeyPressClosure? { get set }
    var keyPressHandler: (KeyboardEvent) -> Void { get set }
}

extension KeyPressHandleable {
    /// The onkeypress event occurs when the user presses a key (on the keyboard).
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeypress.asp)
    @discardableResult
    public func onKeyPress(_ handler: @escaping (KeyboardEvent) -> Void) -> Self {
        guard let s = self as? _KeyPressHandleable else { return self }
        s.keyPressClosure?.release()
        s.keyPressClosure = JSClosure { event in
            s.keyPressHandler(.init(event.jsValue()))
        }
        s.domElement.onkeypress = s.keyPressClosure.jsValue()
        s.keyPressHandler = handler
        return self
    }
    
    @discardableResult
    public func onKeyPress(_ handler: @escaping () -> Void) -> Self {
        onKeyPress { _ in handler() }
    }
}
