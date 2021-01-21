//
//  FullScreenErrorHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol FullScreenErrorHandleable {
    @discardableResult
    func onFullScreenError(_ handler: @escaping () -> Void) -> Self
}

protocol _FullScreenErrorHandleable: _AnyElement, FullScreenErrorHandleable {
    typealias FullScreenErrorClosure = JSClosure
    
    var fullScreenErrorClosure: FullScreenErrorClosure? { get set }
    var fullScreenErrorHandler: (HandledEvent) -> Void { get set }
}

extension FullScreenErrorHandleable {
    /// The fullscreenerror event occurs when an element can not be viewed in fullscreen mode, even if it has been requested.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_fullscreenerror.asp)
    @discardableResult
    public func onFullScreenError(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _FullScreenErrorHandleable else { return self }
        s.fullScreenErrorClosure?.release()
        s.fullScreenErrorClosure = JSClosure { event in
            s.fullScreenErrorHandler(.init(event.jsValue()))
        }
        s.domElement.onfullscreenerror = s.fullScreenErrorClosure.jsValue()
        s.fullScreenErrorHandler = handler
        return self
    }
    
    @discardableResult
    public func onFullScreenError(_ handler: @escaping () -> Void) -> Self {
        onFullScreenError { _ in handler() }
    }
}
