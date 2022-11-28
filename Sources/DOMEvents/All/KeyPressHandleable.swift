//
//  KeyPressHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol KeyPressHandleable: DOMEventable {
    @discardableResult
    func onKeyPress(_ handler: @escaping () -> Void) -> Self
}

fileprivate class KeyPressContainer: Container<KeyboardEvent>, StorageKey {
    typealias Value = KeyPressContainer
}

extension KeyPressHandleable {
    /// The onkeypress event occurs when the user presses a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeypress.asp)
    @discardableResult
    public func onKeyPress(_ handler: @escaping (Self, KeyboardEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onkeypress", createOrUpdate(KeyPressContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The onkeypress event occurs when the user presses a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeypress.asp)
    @discardableResult
    public func onKeyPress(_ handler: @escaping (Self) -> Void) -> Self {
        onKeyPress { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The onkeypress event occurs when the user presses a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeypress.asp)
    @discardableResult
    public func onKeyPress(_ handler: @escaping () -> Void) -> Self {
        onKeyPress { _ in handler() }
    }
}
