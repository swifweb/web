//
//  OnlineHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol OnlineHandleable {
    @discardableResult
    func onOnline(_ handler: @escaping () -> Void) -> Self
}

protocol _OnlineHandleable: _AnyElement, OnlineHandleable {
    typealias OnlineClosure = JSClosure
    
    var onlineClosure: OnlineClosure? { get set }
    var onlineHandler: (HandledEvent) -> Void { get set }
}

extension OnlineHandleable {
    /// The ononline event occurs when the browser starts to work online.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ononline.asp)
    @discardableResult
    public func onOnline(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _OnlineHandleable else { return self }
        s.onlineClosure?.release()
        s.onlineClosure = JSClosure { event in
            s.onlineHandler(.init(event.jsValue()))
        }
        s.domElement.ononline = s.onlineClosure.jsValue()
        s.onlineHandler = handler
        return self
    }
    
    @discardableResult
    public func onOnline(_ handler: @escaping () -> Void) -> Self {
        onOnline { _ in handler() }
    }
}
