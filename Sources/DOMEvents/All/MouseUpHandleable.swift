//
//  MouseUpHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MouseUpHandleable: DOMEventable {
    @discardableResult
    func onMouseUp(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MouseUpContainer: Container<MouseEvent>, StorageKey {
    typealias Value = MouseUpContainer
}

extension MouseUpHandleable {
    /// The onmouseup event occurs when a user releases a mouse button over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseup.asp)
    @discardableResult
    public func onMouseUp(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmouseup", createOrUpdate(MouseUpContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The onmouseup event occurs when a user releases a mouse button over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseup.asp)
    @discardableResult
    public func onMouseUp(_ handler: @escaping (Self) -> Void) -> Self {
        onMouseUp { _,_ in handler(self) }
    }
    
    /// The onmouseup event occurs when a user releases a mouse button over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseup.asp)
    @discardableResult
    public func onMouseUp(_ handler: @escaping () -> Void) -> Self {
        onMouseUp { _ in handler() }
    }
}
