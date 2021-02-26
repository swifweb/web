//
//  ChangeHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ChangeHandleable: DOMEventable {
    @discardableResult
    func onChange(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ChangeContainer: Container<Event>, StorageKey {
    typealias Value = ChangeContainer
}

extension ChangeHandleable {
    /// The onchange event occurs when the value of an element has been changed.
    ///
    /// Applicable to `<input type="checkbox">`, `<input type="color">`, `<input type="date">`,
    /// `<input type="datetime">`, `<input type="email">`, `<input type="file">`,
    /// `<input type="month">`, `<input type="number">`, `<input type="password">`,
    /// `<input type="radio">`, `<input type="range">`, `<input type="search">`,
    /// `<input type="tel">`, `<input type="text">`, `<input type="time">`,
    /// `<input type="url">`, `<input type="week">`, `<select>` and `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onchange.asp)
    @discardableResult
    public func onChange(_ handler: @escaping (Event, Self) -> Void) -> Self {
        setDOMHandlerIfNeeded("onchange", createOrUpdate(ChangeContainer.self) {
            handler($0, self)
        })
    }
    
    /// The onchange event occurs when the value of an element has been changed.
    @discardableResult
    public func onChange(_ handler: @escaping (Event) -> Void) -> Self {
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
