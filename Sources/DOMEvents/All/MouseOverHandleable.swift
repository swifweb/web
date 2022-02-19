//
//  MouseOverHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MouseOverHandleable: DOMEventable {
    @discardableResult
    func onMouseOver(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MouseOverContainer: Container<MouseEvent>, StorageKey {
    typealias Value = MouseOverContainer
}

extension MouseOverHandleable {
    /// The onmouseover event occurs when the mouse pointer is moved onto an element, or onto one of its children.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseover.asp)
    @discardableResult
    public func onMouseOver(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmouseover", createOrUpdate(MouseOverContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The onmouseover event occurs when the mouse pointer is moved onto an element, or onto one of its children.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseover.asp)
    @discardableResult
    public func onMouseOver(_ handler: @escaping (Self) -> Void) -> Self {
        onMouseOver { _,_ in handler(self) }
    }
    
    /// The onmouseover event occurs when the mouse pointer is moved onto an element, or onto one of its children.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseover.asp)
    @discardableResult
    public func onMouseOver(_ handler: @escaping () -> Void) -> Self {
        onMouseOver { _ in handler() }
    }
}
