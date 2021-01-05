//
//  Quotes.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the type of quotation marks for embedded quotations
///
/// ```html
/// #a {
///     quotes: "'" "'";
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_gen_quotes.asp)
public class QuotesProperty: _Property {
    public var propertyKey: PropertyKey<QuotesType> { .quotes }
    public var propertyValue: QuotesType
    var _content = _PropertyContent<QuotesType>()
    
    public init (_ type: QuotesType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var quotes: PropertyKey<QuotesType> { "quotes".propertyKey() }
}
