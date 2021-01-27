//
//  DecodingAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol DecodingAttrable {
    @discardableResult
    func decoding(_ value: DecodingType) -> Self
    @discardableResult
    func decoding<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DecodingType
}

protocol _DecodingAttrable: _AnyElement, DecodingAttrable {}

extension DecodingAttrable {
    /// Indicates the preferred method to decode the image.
    ///
    /// Applicable to `<img>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/decoding)
    @discardableResult
    public func decoding(_ value: DecodingType) -> Self {
        guard let s = self as? _DecodingAttrable else { return self }
        s.setAttribute("decoding", value.value)
        return self
    }
    
    /// Indicates the preferred method to decode the image.
    ///
    /// Applicable to `<img>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/decoding)
    @discardableResult
    public func decoding<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DecodingType {
        decoding(value.stateValue.wrappedValue)
        value.stateValue.listen { self.decoding($0) }
        return self
    }
}

extension Img: _DecodingAttrable {}
