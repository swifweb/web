//
//  ShowHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ShowHandleable {
    @discardableResult
    func onShow(_ handler: @escaping () -> Void) -> Self
}

protocol _ShowHandleable: _AnyElement, ShowHandleable {
    typealias ShowClosure = JSClosure
    
    var showClosure: ShowClosure? { get set }
    var showHandler: (HandledEvent) -> Void { get set }
}

extension ShowHandleable {
    /// The `onshow` event occurs when a `<menu>` element is shown as a context menu.
    ///
    /// Applicable to <menu> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onshow.asp)
    @discardableResult
    public func onShow(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _ShowHandleable else { return self }
        s.showClosure?.release()
        s.showClosure = JSClosure { event in
            s.showHandler(.init(event.jsValue()))
        }
        s.domElement.onshow = s.showClosure.jsValue()
        s.showHandler = handler
        return self
    }
    
    @discardableResult
    public func onShow(_ handler: @escaping () -> Void) -> Self {
        onShow { _ in handler() }
    }
}
