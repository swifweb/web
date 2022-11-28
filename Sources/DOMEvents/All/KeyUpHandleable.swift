//
//  KeyUpHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol KeyUpHandleable: DOMEventable {
    @discardableResult
    func onKeyUp(_ handler: @escaping () -> Void) -> Self
}

fileprivate class KeyUpContainer: Container<KeyboardEvent>, StorageKey {
    typealias Value = KeyUpContainer
}

extension KeyUpHandleable {
    /// The `onkeyup` event occurs when the user releases a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeyup.asp)
    @discardableResult
    public func onKeyUp(_ handler: @escaping (Self, KeyboardEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onkeyup", createOrUpdate(KeyUpContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The `onkeyup` event occurs when the user releases a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeyup.asp)
    @discardableResult
    public func onKeyUp(_ handler: @escaping (Self) -> Void) -> Self {
        onKeyUp { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The `onkeyup` event occurs when the user releases a key (on the keyboard).
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onkeyup.asp)
    @discardableResult
    public func onKeyUp(_ handler: @escaping () -> Void) -> Self {
        onKeyUp { _ in handler() }
    }
}
