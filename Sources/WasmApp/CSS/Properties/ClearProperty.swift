//
//  Clear.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies on which sides of an element floating elements are not allowed to float
///
/// ```html
/// clear: both;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_clear.asp)
public class ClearProperty: _Property {
    public var propertyKey: PropertyKey<ClearType> { .clear }
    public var propertyValue: ClearType
    var _content = _PropertyContent<ClearType>()
    
    public init (_ type: ClearType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ClearType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ClearType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies on which sides of an element floating elements are not allowed to float
    public static var clear: PropertyKey<ClearType> { "clear".propertyKey() }
}

extension Stylesheet {
    /// Specifies on which sides of an element floating elements are not allowed to float
    public typealias Clear = ClearProperty
}

extension CSSRulable {
    /// Specifies on which sides of an element floating elements are not allowed to float
    public func clear(_ type: ClearType) -> Self {
        s?._addProperty(.clear, type)
        return self
    }

    /// Specifies on which sides of an element floating elements are not allowed to float
    public func clear(_ type: State<ClearType>) -> Self {
        s?._addProperty(ClearProperty(type))
        return self
    }

    /// Specifies on which sides of an element floating elements are not allowed to float
    public func clear<V>(_ type: ExpressableState<V, ClearType>) -> Self {
        clear(type.unwrap())
    }
}
