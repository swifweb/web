//
//  MouseDownHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MouseDownHandleable: DOMEventable {
    @discardableResult
    func onMouseDown(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MouseDownContainer: Container<MouseEvent>, StorageKey {
    typealias Value = MouseDownContainer
}

extension MouseDownHandleable {
    /// The onmousedown event occurs when a user presses a mouse button over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousedown.asp)
    @discardableResult
    public func onMouseDown(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmousedown", createOrUpdate(MouseDownContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The onmousedown event occurs when a user presses a mouse button over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousedown.asp)
    @discardableResult
    public func onMouseDown(_ handler: @escaping (Self) -> Void) -> Self {
        onMouseDown { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The onmousedown event occurs when a user presses a mouse button over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousedown.asp)
    @discardableResult
    public func onMouseDown(_ handler: @escaping () -> Void) -> Self {
        onMouseDown { _ in handler() }
    }
}
