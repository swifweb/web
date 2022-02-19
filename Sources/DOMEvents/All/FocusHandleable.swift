//
//  FocusHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol FocusHandleable: DOMEventable {
    @discardableResult
    func onFocus(_ handler: @escaping () -> Void) -> Self
}

fileprivate class FocusContainer: Container<FocusEvent>, StorageKey {
    typealias Value = FocusContainer
}

extension FocusHandleable {
    /// The onfocus event occurs when an element gets focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocus.asp)
    @discardableResult
    func onFocus(_ handler: @escaping (Self, FocusEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onfocus", createOrUpdate(FocusContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The onfocus event occurs when an element gets focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocus.asp)
    @discardableResult
    public func onFocus(_ handler: @escaping (Self) -> Void) -> Self {
        onFocus { _,_ in handler(self) }
    }
    
    /// The onfocus event occurs when an element gets focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocus.asp)
    @discardableResult
    public func onFocus(_ handler: @escaping () -> Void) -> Self {
        onFocus { _ in handler() }
    }
}
