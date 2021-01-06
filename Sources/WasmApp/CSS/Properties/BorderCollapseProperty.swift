//
//  BorderCollapseProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets whether table borders should collapse into a single border or be separated
///
/// ```html
/// border-collapse: separate;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-collapse.asp)
public class BorderCollapseProperty: _Property {
    public var propertyKey: PropertyKey<BorderCollapseType> { .borderCollapse }
    public var propertyValue: BorderCollapseType
    var _content = _PropertyContent<BorderCollapseType>()
    
    public init (_ type: BorderCollapseType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BorderCollapseType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderCollapseType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets whether table borders should collapse into a single border or be separated
    public static var borderCollapse: PropertyKey<BorderCollapseType> { "border-collapse".propertyKey() }
}

extension Stylesheet {
    /// Sets whether table borders should collapse into a single border or be separated
    public typealias BorderCollapse = BorderCollapseProperty
}

extension CSSRulable {
    /// Sets whether table borders should collapse into a single border or be separated
    public func borderCollapse(_ type: BorderCollapseType) -> Self {
        s?._addProperty(.borderCollapse, type)
        return self
    }

    /// Sets whether table borders should collapse into a single border or be separated
    public func borderCollapse(_ type: State<BorderCollapseType>) -> Self {
        s?._addProperty(BorderCollapseProperty(type))
        return self
    }

    /// Sets whether table borders should collapse into a single border or be separated
    public func borderCollapse<V>(_ type: ExpressableState<V, BorderCollapseType>) -> Self {
        borderCollapse(type.unwrap())
    }
}
