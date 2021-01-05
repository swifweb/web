//
//  Order.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var order: PropertyKey<Int> { "order".propertyKey() }
}
