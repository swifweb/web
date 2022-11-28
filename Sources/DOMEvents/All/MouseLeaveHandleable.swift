//
//  MouseLeaveHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MouseLeaveHandleable: DOMEventable {
    @discardableResult
    func onMouseLeave(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MouseLeaveContainer: Container<MouseEvent>, StorageKey {
    typealias Value = MouseLeaveContainer
}

extension MouseLeaveHandleable {
    /// The `onmouseleave` event occurs when the mouse pointer is moved out of an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseleave.asp)
    @discardableResult
    public func onMouseLeave(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmouseleave", createOrUpdate(MouseLeaveContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The `onmouseleave` event occurs when the mouse pointer is moved out of an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseleave.asp)
    @discardableResult
    public func onMouseLeave(_ handler: @escaping (Self) -> Void) -> Self {
        onMouseLeave { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The `onmouseleave` event occurs when the mouse pointer is moved out of an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseleave.asp)
    @discardableResult
    public func onMouseLeave(_ handler: @escaping () -> Void) -> Self {
        onMouseLeave { _ in handler() }
    }
}
