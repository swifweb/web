//
//  AnimationStartHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol AnimationStartHandleable: DOMEventable {
    @discardableResult
    func onAnimationStart(_ handler: @escaping () -> Void) -> Self
}

fileprivate class AnimationStartContainer: Container<AnimationEvent>, StorageKey {
    typealias Value = AnimationStartContainer
}

extension AnimationStartHandleable {
    /// The animationstart event occurs when a CSS animation has started to play.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_animationstart.asp)
    @discardableResult
    public func onAnimationStart(_ handler: @escaping (AnimationEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onanimationstart", createOrUpdate(AnimationStartContainer.self, handler))
    }
    
    @discardableResult
    public func onAnimationStart(_ handler: @escaping () -> Void) -> Self {
        onAnimationStart { _ in handler() }
    }
}
