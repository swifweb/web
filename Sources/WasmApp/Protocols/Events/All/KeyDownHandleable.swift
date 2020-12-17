//
//  KeyDownHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol KeyDownHandleable {
    @discardableResult
    func onKeyDown(_ handler: @escaping () -> Void) -> Self
}

protocol _KeyDownHandleable: _AnyElement, KeyDownHandleable {
    typealias KeyDownClosure = JSClosure
    
    var keyDownClosure: KeyDownClosure? { get set }
    var keyDownHandler: (KeyboardEvent) -> Void { get set }
}

extension KeyDownHandleable {
    /// The `onkeydown` event occurs when the user is pressing a key (on the keyboard).
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeydown.asp)
    @discardableResult
    public func onKeyDown(_ handler: @escaping (KeyboardEvent) -> Void) -> Self {
        guard let s = self as? _KeyDownHandleable else { return self }
        s.keyDownClosure?.release()
        s.keyDownClosure = JSClosure { event in
            s.keyDownHandler(.init(event.jsValue()))
        }
        s.domElement.onkeydown = s.keyDownClosure.jsValue()
        s.keyDownHandler = handler
        return self
    }
    
    @discardableResult
    public func onKeyDown(_ handler: @escaping () -> Void) -> Self {
        onKeyDown { _ in handler() }
    }
}
