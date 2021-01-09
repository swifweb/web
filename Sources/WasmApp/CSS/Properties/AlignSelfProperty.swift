//
//  AlignSelf.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the alignment for selected items inside a flexible container
///
/// ```html
/// align-self: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_align-self.asp)
public class AlignSelfProperty: _Property {
    public var propertyKey: PropertyKey<AlignSelfType> { .alignSelf }
    public var propertyValue: AlignSelfType
    var _content = _PropertyContent<AlignSelfType>()
    
    public init (_ type: AlignSelfType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<AlignSelfType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, AlignSelfType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the alignment for selected items inside a flexible container
    public static var alignSelf: PropertyKey<AlignSelfType> { "align-self".propertyKey() }
}

extension Stylesheet {
    /// Specifies the alignment for selected items inside a flexible container
    public typealias AlignSelf = AlignSelfProperty
}

extension CSSRulable {
    /// Specifies the alignment for selected items inside a flexible container
    public func alignSelf(_ type: AlignSelfType) -> Self {
        s?._addProperty(.alignSelf, type)
        return self
    }

    /// Specifies the alignment for selected items inside a flexible container
    public func alignSelf(_ type: State<AlignSelfType>) -> Self {
        s?._addProperty(AlignSelfProperty(type))
        return self
    }

    /// Specifies the alignment for selected items inside a flexible container
    public func alignSelf<V>(_ type: ExpressableState<V, AlignSelfType>) -> Self {
        alignSelf(type.unwrap())
    }
}
