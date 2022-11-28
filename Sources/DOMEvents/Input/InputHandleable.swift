//
//  InputHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol InputHandleable: DOMEventable {
    @discardableResult
    func onInput(_ handler: @escaping () -> Void) -> Self
}

fileprivate class InputContainer: Container<InputEvent>, StorageKey {
    typealias Value = InputContainer
}

fileprivate class InputSubscriptions: StorageKey {
    typealias Value = [(InputEvent) -> Void]
}

extension InputHandleable {
    /// The oninput event occurs when an element gets user input.
    ///
    /// Applicable to `<input type="color">`, `<input type="date">`,
    /// `<input type="datetime">`, `<input type="email">`, `<input type="month">`,
    /// `<input type="number">`, `<input type="password">`, `<input type="range">`,
    /// `<input type="search">`, `<input type="tel">`, `<input type="text">`,
    /// `<input type="time">`, `<input type="url">`, `<input type="week">` and `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oninput.asp)
    @discardableResult
    public func onInput(_ handler: @escaping (InputEvent, Self) -> Void) -> Self {
        setDOMHandlerIfNeeded("oninput", createOrUpdate(InputContainer.self) { [weak self] in
            guard let self = self else { return }
            handler($0, self)
        })
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
