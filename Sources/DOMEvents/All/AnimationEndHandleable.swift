//
//  AnimationEndHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol AnimationEndHandleable: DOMEventable {
    @discardableResult
    func onAnimationEnd(_ handler: @escaping () -> Void) -> Self
}

fileprivate class AnimationEndContainer: Container<AnimationEvent>, StorageKey {
    typealias Value = AnimationEndContainer
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
    public func onAnimationEnd(_ handler: @escaping (Self, AnimationEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onanimationend", createOrUpdate(AnimationEndContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The animationend event is fired when a CSS Animation has completed.
    /// If the animation aborts before reaching completion,
    /// such as if the element is removed from the DOM or the animation is removed from the element,
    /// the animationend event is not fired.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/animationend_event)
    @discardableResult
    public func onAnimationEnd(_ handler: @escaping (Self) -> Void) -> Self {
        onAnimationEnd { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The animationend event is fired when a CSS Animation has completed.
    /// If the animation aborts before reaching completion,
    /// such as if the element is removed from the DOM or the animation is removed from the element,
    /// the animationend event is not fired.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/animationend_event)
    @discardableResult
    public func onAnimationEnd(_ handler: @escaping () -> Void) -> Self {
        onAnimationEnd { _ in handler() }
    }
}
