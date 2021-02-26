//
//  DblClickHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol DblClickHandleable: DOMEventable {
    @discardableResult
    func onDblClick(_ handler: @escaping () -> Void) -> Self
}

fileprivate class DblClickContainer: Container<MouseEvent>, StorageKey {
    typealias Value = DblClickContainer
}

extension DblClickHandleable {
    /// The ondblclick event occurs when the user double-clicks on an element.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondblclick.asp)
    @discardableResult
    public func onDblClick(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("ondblclick", createOrUpdate(DblClickContainer.self, handler))
    }
    
    @discardableResult
    public func onDblClick(_ handler: @escaping () -> Void) -> Self {
        onDblClick { _ in handler() }
    }
}
