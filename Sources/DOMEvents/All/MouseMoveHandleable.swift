//
//  MouseMoveHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MouseMoveHandleable: DOMEventable {
    @discardableResult
    func onMouseMove(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MouseMoveContainer: Container<MouseEvent>, StorageKey {
    typealias Value = MouseMoveContainer
}

extension MouseMoveHandleable {
    /// The onmousemove event occurs when the pointer is moving while it is over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousemove.asp)
    @discardableResult
    public func onMouseMove(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmousemove", createOrUpdate(MouseMoveContainer.self, handler))
    }
    
    @discardableResult
    public func onMouseMove(_ handler: @escaping () -> Void) -> Self {
        onMouseMove { _ in handler() }
    }
}
