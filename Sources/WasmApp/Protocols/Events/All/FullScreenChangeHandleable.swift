//
//  FullScreenChangeHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol FullScreenChangeHandleable {
    @discardableResult
    func onFullScreenChange(_ handler: @escaping () -> Void) -> Self
}

protocol _FullScreenChangeHandleable: _AnyElement, FullScreenChangeHandleable {
    typealias FullScreenChangeClosure = JSClosure
    
    var fullScreenChangeClosure: FullScreenChangeClosure? { get set }
    var fullScreenChangeHandler: (HandledEvent) -> Void { get set }
}

extension FullScreenChangeHandleable {
    /// The fullscreenchange event occurs when an element is viewed in fullscreen mode.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_fullscreenchange.asp)
    @discardableResult
    public func onFullScreenChange(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _FullScreenChangeHandleable else { return self }
        s.fullScreenChangeClosure?.release()
        s.fullScreenChangeClosure = JSClosure { event in
            s.fullScreenChangeHandler(.init(event.jsValue()))
        }
        s.domElement.onfullscreenchange = s.fullScreenChangeClosure.jsValue()
        s.fullScreenChangeHandler = handler
        return self
    }
    
    @discardableResult
    public func onFullScreenChange(_ handler: @escaping () -> Void) -> Self {
        onFullScreenChange { _ in handler() }
    }
}
