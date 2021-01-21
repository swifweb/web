//
//  KeyUpHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol KeyUpHandleable {
    @discardableResult
    func onKeyUp(_ handler: @escaping () -> Void) -> Self
}

protocol _KeyUpHandleable: _AnyElement, KeyUpHandleable {
    typealias KeyUpClosure = JSClosure
    
    var keyUpClosure: KeyUpClosure? { get set }
    var keyUpHandler: (KeyboardEvent) -> Void { get set }
}

extension KeyUpHandleable {
    /// The `onkeyup` event occurs when the user releases a key (on the keyboard).
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeyup.asp)
    @discardableResult
    public func onKeyUp(_ handler: @escaping (KeyboardEvent) -> Void) -> Self {
        guard let s = self as? _KeyUpHandleable else { return self }
        s.keyUpClosure?.release()
        s.keyUpClosure = JSClosure { event in
            s.keyUpHandler(.init(event.jsValue()))
        }
        s.domElement.onkeyup = s.keyUpClosure.jsValue()
        s.keyUpHandler = handler
        return self
    }
    
    @discardableResult
    public func onKeyUp(_ handler: @escaping () -> Void) -> Self {
        onKeyUp { _ in handler() }
    }
}
