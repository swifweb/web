//
//  TransitionEndHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol TransitionEndHandleable {
    @discardableResult
    func onTransitionEnd(_ handler: @escaping () -> Void) -> Self
}

protocol _TransitionEndHandleable: _AnyElement, TransitionEndHandleable {
    typealias TransitionEndClosure = JSClosure
    
    var transitionEndClosure: TransitionEndClosure? { get set }
    var transitionEndHandler: (TransitionEvent) -> Void { get set }
}

extension TransitionEndHandleable {
    /// The transitionend event occurs when a CSS transition has completed.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_transitionend.asp)
    @discardableResult
    public func onTransitionEnd(_ handler: @escaping (TransitionEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _TransitionEndHandleable else { return self }
        s.transitionEndClosure?.release()
        s.transitionEndClosure = JSClosure { event in
            s.transitionEndHandler(.init(event.jsValue()))
        }
        s.domElement.ontransitionend = s.transitionEndClosure.jsValue()
        s.transitionEndHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onTransitionEnd(_ handler: @escaping () -> Void) -> Self {
        onTransitionEnd { _ in handler() }
    }
}
