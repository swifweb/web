//
//  KeyDownHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol KeyDownHandleable: DOMEventable {
    @discardableResult
    func onKeyDown(_ handler: @escaping () -> Void) -> Self
}

fileprivate class KeyDownContainer: Container<KeyboardEvent>, StorageKey {
    typealias Value = KeyDownContainer
}

extension KeyDownHandleable {
    /// The `onkeydown` event occurs when the user is pressing a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeydown.asp)
    @discardableResult
    public func onKeyDown(_ handler: @escaping (KeyboardEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onkeydown", createOrUpdate(KeyDownContainer.self, handler))
    }
    
    @discardableResult
    public func onKeyDown(_ handler: @escaping () -> Void) -> Self {
        onKeyDown { _ in handler() }
    }
}
