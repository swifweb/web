//
//  Order.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the order of the flexible item, relative to the rest
///
/// ```html
/// order: 1;
/// order: 2;
/// order: 3;
/// order: 4;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_order.asp)
public class OrderProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .order }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ v: Int) {
        propertyValue = v
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
    /// Sets the order of the flexible item, relative to the rest
    public static var order: PropertyKey<Int> { "order".propertyKey() }
}

extension Stylesheet {
    /// Sets the order of the flexible item, relative to the rest
    public typealias Order = OrderProperty
}

extension CSSRulable {
    /// Sets the order of the flexible item, relative to the rest
    public func order(_ type: Int) -> Self {
        s?._addProperty(.order, type)
        return self
    }

    /// Sets the order of the flexible item, relative to the rest
    public func order(_ type: State<Int>) -> Self {
        s?._addProperty(OrderProperty(type))
        return self
    }

    /// Sets the order of the flexible item, relative to the rest
    public func order<V>(_ type: ExpressableState<V, Int>) -> Self {
        order(type.unwrap())
    }
}
