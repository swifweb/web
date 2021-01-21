//
//  ColumnRuleStyleProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the style of the rule between columns
///
/// ```html
/// column-rule-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-rule-style.asp)
public class ColumnRuleStyleProperty: _Property {
    public var propertyKey: PropertyKey<ColumnRuleStyleType> { .columnRuleStyle }
    public var propertyValue: ColumnRuleStyleType
    var _content = _PropertyContent<ColumnRuleStyleType>()
    
    public init (_ type: ColumnRuleStyleType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ColumnRuleStyleType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ColumnRuleStyleType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the style of the rule between columns
    public static var columnRuleStyle: PropertyKey<ColumnRuleStyleType> { "column-rule-style".propertyKey() }
}

extension Stylesheet {
    /// Specifies the style of the rule between columns
    public typealias ColumnRuleStyle = ColumnRuleStyleProperty
}

extension CSSRulable {
    /// Specifies the style of the rule between columns
    public func columnRuleStyle(_ type: ColumnRuleStyleType) -> Self {
        s?._addProperty(.columnRuleStyle, type)
        return self
    }

    /// Specifies the style of the rule between columns
    public func columnRuleStyle(_ type: State<ColumnRuleStyleType>) -> Self {
        s?._addProperty(ColumnRuleStyleProperty(type))
        return self
    }

    /// Specifies the style of the rule between columns
    public func columnRuleStyle<V>(_ type: ExpressableState<V, ColumnRuleStyleType>) -> Self {
        columnRuleStyle(type.unwrap())
    }
}
