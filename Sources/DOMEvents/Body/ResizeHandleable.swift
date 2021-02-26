//
//  ResizeHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ResizeHandleable: DOMEventable {
    @discardableResult
    func onResize(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ResizeContainer: Container<UIEvent>, StorageKey {
    typealias Value = ResizeContainer
}

extension ResizeHandleable {
    /// The onresize event occurs when the browser window has been resized.
    ///
    /// Applicable to `<body>` tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onresize.asp)
    @discardableResult
    public func onResize(_ handler: @escaping (UIEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onresize", createOrUpdate(ResizeContainer.self, handler))
    }
    
    @discardableResult
    public func onResize(_ handler: @escaping () -> Void) -> Self {
        onResize { _ in handler() }
    }
}
