//
//  ChangeHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ChangeHandleable {
    @discardableResult
    func onChange(_ handler: @escaping () -> Void) -> Self
}

protocol _ChangeHandleable: _AnyElement, ChangeHandleable {
    typealias ChangeClosure = JSClosure
    
    var changeClosure: ChangeClosure? { get set }
    var changeHandler: (HandledEvent) -> Void { get set }
    
    func subscribeToChanges()
    func onChange(_ event: HandledEvent)
}

extension _ChangeHandleable {
    func subscribeToChanges() {
        changeClosure?.release()
        changeClosure = JSClosure { event -> Void in
            let event = HandledEvent(event.jsValue())
            self.onChange(event)
            self.changeHandler(event)
        }
        domElement.onchange = changeClosure.jsValue()
    }
}

extension ChangeHandleable {
    /// The onchange event occurs when the value of an element has been changed.
    ///
    /// Applicable to <input type="checkbox">, <input type="color">, <input type="date">,
    /// <input type="datetime">, <input type="email">, <input type="file">,
    /// <input type="month">, <input type="number">, <input type="password">,
    /// <input type="radio">, <input type="range">, <input type="search">,
    /// <input type="tel">, <input type="text">, <input type="time">,
    /// <input type="url">, <input type="week">, <select> and <textarea>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onchange.asp)
    @discardableResult
    public func onChange(_ handler: @escaping (HandledEvent, Self) -> Void) -> Self {
        guard let s = self as? _ChangeHandleable else { return self }
        s.changeHandler = {
            handler($0, self)
        }
        return self
    }
    
    /// The onchange event occurs when the value of an element has been changed.
    @discardableResult
    public func onChange(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        onChange { event, _ in
            handler(event)
        }
    }
    
    /// The onchange event occurs when the value of an element has been changed.
    @discardableResult
    public func onChange(_ handler: @escaping () -> Void) -> Self {
        onChange { _ in handler() }
    }
}
