//
//  AnimationStartHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AnimationStartHandleable {
    @discardableResult
    func onAnimationStart(_ handler: @escaping () -> Void) -> Self
}

protocol _AnimationStartHandleable: _AnyElement, AnimationStartHandleable {
    typealias AnimationStartClosure = JSClosure
    
    var animationStartClosure: AnimationStartClosure? { get set }
    var animationStartHandler: (AnimationEvent) -> Void { get set }
}

extension AnimationStartHandleable {
    /// The animationstart event occurs when a CSS animation has started to play.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_animationstart.asp)
    @discardableResult
    public func onAnimationStart(_ handler: @escaping (AnimationEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _AnimationStartHandleable else { return self }
        s.animationStartClosure?.release()
        s.animationStartClosure = JSClosure { event in
            s.animationStartHandler(.init(event.jsValue()))
        }
        s.domElement.onanimationstart = s.animationStartClosure.jsValue()
        s.animationStartHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onAnimationStart(_ handler: @escaping () -> Void) -> Self {
        onAnimationStart { _ in handler() }
    }
}
