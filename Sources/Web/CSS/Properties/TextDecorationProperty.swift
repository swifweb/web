//
//  TextDecoration.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the decoration added to text
///
/// ```html
/// h1 {
///     text-decoration: overline;
/// }
///
/// h2 {
///     text-decoration: line-through;
/// }
///
/// h3 {
///     text-decoration: underline;
/// }
///
/// h4 {
///     text-decoration: underline overline;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-decoration.asp)
public class TextDecorationProperty: _Property {
    public var propertyKey: PropertyKey<TextDecorationValue> { .textDecoration }
    public var propertyValue: TextDecorationValue
    var _content = _PropertyContent<TextDecorationValue>()
    
    public init (_ line: TextDecorationLineType, _ color: Color, _ style: TextDecorationStyleType) {
        propertyValue = TextDecorationValue(line, color, style)
    }
    
    //    public convenience init (_ type: State<<#T##c: Type##Type#>>) {
    //        self.init(type.wrappedValue)
    //        type.listen { self._changed(to: $0) }
    //    }
    //
    //    public convenience init <V>(_ type: ExpressableState<V, <#T##c: Type##Type#>>) {
    //        self.init(type.unwrap())
    //    }
}

extension PropertyKey {
    public static var textDecoration: PropertyKey<TextDecorationValue> { "text-decoration".propertyKey() }
}

public struct TextDecorationValue: CustomStringConvertible {
    let line: TextDecorationLineType
    let color: Color
    let style: TextDecorationStyleType
    
    public init (_ line: TextDecorationLineType, _ color: Color, _ style: TextDecorationStyleType) {
        self.line = line
        self.color = color
        self.style = style
    }
    
    public var description: String {
        [line.value, color.description, style.value].joined(separator: " ")
    }
}

//extension Stylesheet {
//    <#T##c: Docs##String#>
//    public typealias <#T##c: Alias##String#> = <#T##c: Original##Original#>
//}
//
//extension CSSRulable {
//    <#T##c: Docs##String#>
//    public func <#T##c: variableName##variableName#>(_ type: <#T##c: Type##Type#>) -> Self {
//        s?._addProperty(.<#T##c: variableName##variableName#>, type)
//        return self
//    }
//
//    <#T##c: Docs##String#>
//    public func <#T##c: variableName##variableName#>(_ type: State<<#T##c: Type##Type#>>) -> Self {
//        s?._addProperty(<#T##c: Original##Original#>(type))
//        return self
//    }
//
//    <#T##c: Docs##String#>
//    public func <#T##c: variableName##variableName#><V>(_ type: ExpressableState<V, <#T##c: Type##Type#>>) -> Self {
//        <#T##c: variableName##variableName#>(type.unwrap())
//    }
//}
