//
//  AnimationEndHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AnimationEndHandleable {
    @discardableResult
    func onAnimationEnd(_ handler: @escaping () -> Void) -> Self
}

protocol _AnimationEndHandleable: _AnyElement, AnimationEndHandleable {
    typealias AnimationEndClosure = JSClosure
    
    var animationEndClosure: AnimationEndClosure? { get set }
    var animationEndHandler: (AnimationEvent) -> Void { get set }
}

extension AnimationEndHandleable {
    /// The animationend event is fired when a CSS Animation has completed.
    /// If the animation aborts before reaching completion,
    /// such as if the element is removed from the DOM or the animation is removed from the element,
    /// the animationend event is not fired.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/animationend_event)
    @discardableResult
    public func onAnimationEnd(_ handler: @escaping (AnimationEvent) -> Void) -> Self {
        guard let s = self as? _AnimationEndHandleable else { return self }
        s.animationEndClosure?.release()
        s.animationEndClosure = JSClosure { event in
            s.animationEndHandler(.init(event.jsValue()))
        }
        s.domElement.onanimationend = s.animationEndClosure.jsValue()
        s.animationEndHandler = handler
        return self
    }
    
    @discardableResult
    public func onAnimationEnd(_ handler: @escaping () -> Void) -> Self {
        onAnimationEnd { _ in handler() }
    }
}
