//
//  InputHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol InputHandleable {
    @discardableResult
    func onInput(_ handler: @escaping () -> Void) -> Self
}

protocol _InputHandleable: _AnyElement, InputHandleable {
    typealias InputClosure = JSClosure
    
    var inputClosure: InputClosure? { get set }
    var inputHandler: (InputEvent) -> Void { get set }
    
    func subscribeToInput()
    func onInput(_ event: InputEvent)
}

extension _InputHandleable {
    func subscribeToInput() {
        inputClosure?.release()
        inputClosure = JSClosure { event -> Void in
            let event = InputEvent(event.jsValue())
            self.inputHandler(event)
            self.onInput(event)
        }
        domElement.oninput = inputClosure.jsValue()
    }
}

extension InputHandleable {
    /// The oninput event occurs when an element gets user input.
    ///
    /// Applicable to <input type="color">, <input type="date">,
    /// <input type="datetime">, <input type="email">, <input type="month">,
    /// <input type="number">, <input type="password">, <input type="range">,
    /// <input type="search">, <input type="tel">, <input type="text">,
    /// <input type="time">, <input type="url">, <input type="week"> and <textarea>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oninput.asp)
    @discardableResult
    public func onInput(_ handler: @escaping (InputEvent, Self) -> Void) -> Self {
        guard let s = self as? _InputHandleable else { return self }
        s.inputClosure?.release()
        s.inputClosure = JSClosure { event in
            s.inputHandler(.init(event.jsValue()))
        }
        s.domElement.oninput = s.inputClosure.jsValue()
        s.inputHandler = {
            handler($0, self)
        }
        return self
    }
    
    /// The oninput event occurs when an element gets user input.
    @discardableResult
    public func onInput(_ handler: @escaping (InputEvent) -> Void) -> Self {
        onInput { event, _ in
            handler(event)
        }
    }
    
    /// The oninput event occurs when an element gets user input.
    @discardableResult
    public func onInput(_ handler: @escaping () -> Void) -> Self {
        onInput { _ in handler() }
    }
}
