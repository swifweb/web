//
//  ScrollHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ScrollHandleable {
    @discardableResult
    func onScroll(_ handler: @escaping () -> Void) -> Self
}

protocol _ScrollHandleable: _AnyElement, ScrollHandleable {
    typealias ScrollClosure = JSClosure
    
    var scrollClosure: ScrollClosure? { get set }
    var scrollHandler: (UIEvent) -> Void { get set }
}

extension ScrollHandleable {
    /// The onscroll event occurs when an element's scrollbar is being scrolled.
    ///
    /// Applicable to <address>, <blockquote>, <body>, <caption>, <center>, <dd>, <dir>,
    /// <div>, <dl>, <dt>, <fieldset>, <form>, <h1> to <h6>, <html>, <li>, <menu>,
    /// <object>, <ol>, <p>, <pre>, <select>, <tbody>, <textarea>, <tfoot>, <thead>, <ul>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onscroll.asp)
    @discardableResult
    public func onScroll(_ handler: @escaping (UIEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _ScrollHandleable else { return self }
        s.scrollClosure?.release()
        s.scrollClosure = JSClosure { event in
            s.scrollHandler(.init(event.jsValue()))
        }
        s.domElement.onscroll = s.scrollClosure.jsValue()
        s.scrollHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onScroll(_ handler: @escaping () -> Void) -> Self {
        onScroll { _ in handler() }
    }
}
