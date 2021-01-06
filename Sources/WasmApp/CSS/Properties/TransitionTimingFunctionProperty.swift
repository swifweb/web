//
//  TransitionTimingFunction.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the speed curve of the transition effect
///
/// ```html
/// div {
///     transition-timing-function: linear;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-timing-function.asp)
public class TransitionTimingFunctionProperty: _Property {
    public var propertyKey: PropertyKey<TransitionTimingFunctionType> { .transitionTimingFunction }
    public var propertyValue: TransitionTimingFunctionType
    var _content = _PropertyContent<TransitionTimingFunctionType>()
    
    public init (_ type: TransitionTimingFunctionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TransitionTimingFunctionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TransitionTimingFunctionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the speed curve of the transition effect
    public static var transitionTimingFunction: PropertyKey<TransitionTimingFunctionType> { "transition-timing-function".propertyKey() }
}

extension Stylesheet {
    /// Specifies the speed curve of the transition effect
    public typealias TransitionTimingFunction = TransitionTimingFunctionProperty
}

extension CSSRulable {
    /// Specifies the speed curve of the transition effect
    public func transitionTimingFunction(_ type: TransitionTimingFunctionType) -> Self {
        s?._addProperty(.transitionTimingFunction, type)
        return self
    }

    /// Specifies the speed curve of the transition effect
    public func transitionTimingFunction(_ type: State<TransitionTimingFunctionType>) -> Self {
        s?._addProperty(TransitionTimingFunctionProperty(type))
        return self
    }

    /// Specifies the speed curve of the transition effect
    public func transitionTimingFunction<V>(_ type: ExpressableState<V, TransitionTimingFunctionType>) -> Self {
        transitionTimingFunction(type.unwrap())
    }
}
