//
//  HashChangeHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol HashChangeHandleable {
    @discardableResult
    func onHashChange(_ handler: @escaping () -> Void) -> Self
}

protocol _HashChangeHandleable: _AnyElement, HashChangeHandleable {
    typealias HashChangeClosure = JSClosure
    
    var hashChangeClosure: HashChangeClosure? { get set }
    var hashChangeHandler: (HashChangeEvent) -> Void { get set }
}

extension HashChangeHandleable {
    /// The onhashchange event occurs when there has been changes to the anchor part (begins with a '#' symbol) of the current URL.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onhashchange.asp)
    @discardableResult
    public func onHashChange(_ handler: @escaping (HashChangeEvent) -> Void) -> Self {
        guard let s = self as? _HashChangeHandleable else { return self }
        s.hashChangeClosure?.release()
        s.hashChangeClosure = JSClosure { event in
            s.hashChangeHandler(.init(event.jsValue()))
        }
        s.domElement.onhashchange = s.hashChangeClosure.jsValue()
        s.hashChangeHandler = handler
        return self
    }
    
    @discardableResult
    public func onHashChange(_ handler: @escaping () -> Void) -> Self {
        onHashChange { _ in handler() }
    }
}
