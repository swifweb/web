//
//  ScrollHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ScrollHandleable: DOMEventable {
    @discardableResult
    func onScroll(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ScrollContainer: Container<UIEvent>, StorageKey {
    typealias Value = ScrollContainer
}

extension ScrollHandleable {
    /// The onscroll event occurs when an element's scrollbar is being scrolled.
    ///
    /// Applicable to `<address>`, `<blockquote>`, `<body>`, `<caption>`, `<center>`, `<dd>`, `<dir>`,
    /// `<div>`, `<dl>`, `<dt>`, `<fieldset>`, `<form>`, `<h1> to <h6>`, `<html>`, `<li>`, `<menu>`,
    /// `<object>`, `<ol>`, `<p>`, `<pre>`, `<select>`, `<tbody>`, `<textarea>`, `<tfoot>`, `<thead>`, `<ul>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onscroll.asp)
    @discardableResult
    public func onScroll(_ handler: @escaping (UIEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onscroll", createOrUpdate(ScrollContainer.self, handler))
    }
    
    @discardableResult
    public func onScroll(_ handler: @escaping () -> Void) -> Self {
        onScroll { _ in handler() }
    }
}
