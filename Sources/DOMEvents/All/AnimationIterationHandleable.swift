//
//  AnimationIterationHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol AnimationIterationHandleable: DOMEventable {
    @discardableResult
    func onAnimationIteration(_ handler: @escaping () -> Void) -> Self
}

fileprivate class AnimationIterationContainer: Container<AnimationEvent>, StorageKey {
    typealias Value = AnimationIterationContainer
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
        setDOMHandlerIfNeeded("onanimationiteration", createOrUpdate(AnimationIterationContainer.self, handler))
    }
    
    @discardableResult
    public func onAnimationIteration(_ handler: @escaping () -> Void) -> Self {
        onAnimationIteration { _ in handler() }
    }
}
