//
//  MouseEnterHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MouseEnterHandleable: DOMEventable {
    @discardableResult
    func onMouseEnter(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MouseEnterContainer: Container<MouseEvent>, StorageKey {
    typealias Value = MouseEnterContainer
}

extension MouseEnterHandleable {
    /// The onmouseenter event occurs when the mouse pointer is moved onto an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseenter.asp)
    @discardableResult
    public func onMouseEnter(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmouseenter", createOrUpdate(MouseEnterContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The onmouseenter event occurs when the mouse pointer is moved onto an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseenter.asp)
    @discardableResult
    public func onMouseEnter(_ handler: @escaping (Self) -> Void) -> Self {
        onMouseEnter { _,_ in handler(self) }
    }
    
    /// The onmouseenter event occurs when the mouse pointer is moved onto an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseenter.asp)
    @discardableResult
    public func onMouseEnter(_ handler: @escaping () -> Void) -> Self {
        onMouseEnter { _ in handler() }
    }
}
