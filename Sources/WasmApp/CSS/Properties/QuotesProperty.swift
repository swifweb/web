//
//  Quotes.swift
//  WasmApp
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
    
    public convenience init (_ type: State<QuotesType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, QuotesType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the type of quotation marks for embedded quotations
    public static var quotes: PropertyKey<QuotesType> { "quotes".propertyKey() }
}

extension Stylesheet {
    /// Sets the type of quotation marks for embedded quotations
    public typealias Quotes = QuotesProperty
}

extension CSSRulable {
    /// Sets the type of quotation marks for embedded quotations
    public func quotes(_ type: QuotesType) -> Self {
        s?._addProperty(.quotes, type)
        return self
    }

    /// Sets the type of quotation marks for embedded quotations
    public func quotes(_ type: State<QuotesType>) -> Self {
        s?._addProperty(QuotesProperty(type))
        return self
    }

    /// Sets the type of quotation marks for embedded quotations
    public func quotes<V>(_ type: ExpressableState<V, QuotesType>) -> Self {
        quotes(type.unwrap())
    }
}
