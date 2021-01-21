//
//  WritingMode.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies whether lines of text are laid out horizontally or vertically
///
/// ```html
/// p.test1 {
///     writing-mode: horizontal-tb;
/// }
///
/// p.test2 {
///     writing-mode: vertical-rl;
/// }
///
/// span.test2 {
///     writing-mode: vertical-rl;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_writing-mode.asp)
public class WritingModeProperty: _Property {
    public var propertyKey: PropertyKey<WritingModeType> { .writingMode }
    public var propertyValue: WritingModeType
    var _content = _PropertyContent<WritingModeType>()
    
    public init (_ type: WritingModeType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<WritingModeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, WritingModeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether lines of text are laid out horizontally or vertically
    public static var writingMode: PropertyKey<WritingModeType> { "writing-mode".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether lines of text are laid out horizontally or vertically
    public typealias WritingMode = WritingModeProperty
}

extension CSSRulable {
    /// Specifies whether lines of text are laid out horizontally or vertically
    public func writingMode(_ type: WritingModeType) -> Self {
        s?._addProperty(.writingMode, type)
        return self
    }

    /// Specifies whether lines of text are laid out horizontally or vertically
    public func writingMode(_ type: State<WritingModeType>) -> Self {
        s?._addProperty(WritingModeProperty(type))
        return self
    }

    /// Specifies whether lines of text are laid out horizontally or vertically
    public func writingMode<V>(_ type: ExpressableState<V, WritingModeType>) -> Self {
        writingMode(type.unwrap())
    }
}
