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
    public func onMouseDown(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmousedown", createOrUpdate(MouseDownContainer.self, handler))
    }
    
    @discardableResult
    public func onMouseDown(_ handler: @escaping () -> Void) -> Self {
        onMouseDown { _ in handler() }
    }
}
