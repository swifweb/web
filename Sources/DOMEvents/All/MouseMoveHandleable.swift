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
    public func onMouseMove(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onmousemove", createOrUpdate(MouseMoveContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The onmousemove event occurs when the pointer is moving while it is over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousemove.asp)
    @discardableResult
    public func onMouseMove(_ handler: @escaping (Self) -> Void) -> Self {
        onMouseMove { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The onmousemove event occurs when the pointer is moving while it is over an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onmousemove.asp)
    @discardableResult
    public func onMouseMove(_ handler: @escaping () -> Void) -> Self {
        onMouseMove { _ in handler() }
    }
}
