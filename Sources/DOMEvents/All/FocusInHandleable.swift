//
//  FocusInHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol FocusInHandleable: DOMEventable {
    @discardableResult
    func onFocusIn(_ handler: @escaping () -> Void) -> Self
}

fileprivate class FocusInContainer: Container<FocusEvent>, StorageKey {
    typealias Value = FocusInContainer
}

extension FocusInHandleable {
    /// The onfocusin event occurs when an element is about to get focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusin.asp)
    @discardableResult
    public func onFocusIn(_ handler: @escaping (FocusEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onfocusin", createOrUpdate(FocusInContainer.self, handler))
    }
    
    @discardableResult
    public func onFocusIn(_ handler: @escaping () -> Void) -> Self {
        onFocusIn { _ in handler() }
    }
}
