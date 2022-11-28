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
    public func onKeyDown(_ handler: @escaping (Self, KeyboardEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onkeydown", createOrUpdate(KeyDownContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The `onkeydown` event occurs when the user is pressing a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeydown.asp)
    @discardableResult
    public func onKeyDown(_ handler: @escaping (Self) -> Void) -> Self {
        onKeyDown { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The `onkeydown` event occurs when the user is pressing a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeydown.asp)
    @discardableResult
    public func onKeyDown(_ handler: @escaping () -> Void) -> Self {
        onKeyDown { _ in handler() }
    }
}
