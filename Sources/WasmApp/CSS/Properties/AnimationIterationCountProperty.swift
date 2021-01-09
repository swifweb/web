//
//  AnimationIterationCount.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the number of times an animation should be played
///
/// ```html
/// animation-iteration-count: 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-iteration-count.asp)
public class AnimationIterationCountProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .animationIterationCount }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ n: Int) {
        propertyValue = n
    }
    
    public convenience init (_ type: State<Int>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, Int>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the number of times an animation should be played
    public static var animationIterationCount: PropertyKey<Int> { "animation-iteration-count".propertyKey() }
}

extension Stylesheet {
    /// Specifies the number of times an animation should be played
    public typealias AnimationIterationCount = AnimationIterationCountProperty
}

extension CSSRulable {
    /// Specifies the number of times an animation should be played
    public func animationIterationCount(_ type: Int) -> Self {
        s?._addProperty(.animationIterationCount, type)
        return self
    }

    /// Specifies the number of times an animation should be played
    public func animationIterationCount(_ type: State<Int>) -> Self {
        s?._addProperty(AnimationIterationCountProperty(type))
        return self
    }

    /// Specifies the number of times an animation should be played
    public func animationIterationCount<V>(_ type: ExpressableState<V, Int>) -> Self {
        animationIterationCount(type.unwrap())
    }
}
