//
//  SelectHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SelectHandleable: DOMEventable {
    @discardableResult
    func onSelect(_ handler: @escaping () -> Void) -> Self
}

fileprivate class SelectContainer: Container<UIEvent>, StorageKey {
    typealias Value = SelectContainer
}

extension SelectHandleable {
    /// The `onselect` event occurs after some text has been selected in an element.
    ///
    /// Applicable to `<input type="file">`, `<input type="password">`, `<input type="text">`, and `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onselect.asp)
    @discardableResult
    public func onSelect(_ handler: @escaping (UIEvent, Self) -> Void) -> Self {
        setDOMHandlerIfNeeded("onselect", createOrUpdate(SelectContainer.self) { [weak self] in
            guard let self = self else { return }
            handler($0, self)
        })
    }
    
    /// The `onselect` event occurs after some text has been selected in an element.
    @discardableResult
    public func onSelect(_ handler: @escaping (UIEvent) -> Void) -> Self {
        onSelect { event, _ in
            handler(event)
        }
    }
    
    /// The `onselect` event occurs after some text has been selected in an element.
    @discardableResult
    public func onSelect(_ handler: @escaping () -> Void) -> Self {
        onSelect { _ in handler() }
    }
}
