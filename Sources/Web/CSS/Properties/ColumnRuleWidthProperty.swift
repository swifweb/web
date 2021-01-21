//
//  ColumnRuleWidthProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the width of the rule between columns
///
/// ```html
/// column-rule-width: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-rule-width.asp)
public class ColumnRuleWidthProperty: _Property {
    public var propertyKey: PropertyKey<ColumnRuleWidthType> { .columnRuleWidth }
    public var propertyValue: ColumnRuleWidthType
    var _content = _PropertyContent<ColumnRuleWidthType>()
    
    public init (_ type: ColumnRuleWidthType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ColumnRuleWidthType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ColumnRuleWidthType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the width of the rule between columns
    public static var columnRuleWidth: PropertyKey<ColumnRuleWidthType> { "column-rule-width".propertyKey() }
}

extension Stylesheet {
    /// Specifies the width of the rule between columns
    public typealias ColumnRuleWidth = ColumnRuleWidthProperty
}

extension CSSRulable {
    /// Specifies the width of the rule between columns
    public func columnRuleWidth(_ type: ColumnRuleWidthType) -> Self {
        s?._addProperty(.columnRuleWidth, type)
        return self
    }

    /// Specifies the width of the rule between columns
    public func columnRuleWidth(_ type: State<ColumnRuleWidthType>) -> Self {
        s?._addProperty(ColumnRuleWidthProperty(type))
        return self
    }

    /// Specifies the width of the rule between columns
    public func columnRuleWidth<V>(_ type: ExpressableState<V, ColumnRuleWidthType>) -> Self {
        columnRuleWidth(type.unwrap())
    }
}
