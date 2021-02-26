//
//  MouseOutHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol MouseOutHandleable: DOMEventable {
    @discardableResult
    func onMouseOut(_ handler: @escaping () -> Void) -> Self
}

fileprivate class MouseOutContainer: Container<MouseEvent>, StorageKey {
    typealias Value = MouseOutContainer
}

extension MouseOutHandleable {
    /// The onmouseout event occurs when the mouse pointer is moved out of an element, or out of one of its children.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmouseout.asp)
    @discardableResult
    public func onMouseOut(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmouseout", createOrUpdate(MouseOutContainer.self, handler))
    }
    
    @discardableResult
    public func onMouseOut(_ handler: @escaping () -> Void) -> Self {
        onMouseOut { _ in handler() }
    }
}
