//
//  AnimationIterationHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AnimationIterationHandleable {
    @discardableResult
    func onAnimationIteration(_ handler: @escaping () -> Void) -> Self
}

protocol _AnimationIterationHandleable: _AnyElement, AnimationIterationHandleable {
    typealias AnimationIterationClosure = JSClosure
    
    var animationIterationClosure: AnimationIterationClosure? { get set }
    var animationIterationHandler: (AnimationEvent) -> Void { get set }
}

extension AnimationIterationHandleable {
    /// The animationiteration event is sent when a CSS animation reaches the end of an iteration.
    /// An iteration ends when a single pass through the sequence
    /// of animation instructions is completed by executing the last animation step.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onanimationiteration)
    @discardableResult
    public func onAnimationIteration(_ handler: @escaping (AnimationEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _AnimationIterationHandleable else { return self }
        s.animationIterationClosure?.release()
        s.animationIterationClosure = JSClosure { event in
            s.animationIterationHandler(.init(event.jsValue()))
        }
        s.domElement.onanimationiteration = s.animationIterationClosure.jsValue()
        s.animationIterationHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onAnimationIteration(_ handler: @escaping () -> Void) -> Self {
        onAnimationIteration { _ in handler() }
    }
}
