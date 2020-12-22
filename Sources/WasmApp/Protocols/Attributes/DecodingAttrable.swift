//
//  DecodingAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DecodingAttrable {
    @discardableResult
    func decoding(_ value: DecodingType) -> Self
    @discardableResult
    func decoding(_ value: State<DecodingType>) -> Self
    @discardableResult
    func decoding<V>(_ expressable: ExpressableState<V, DecodingType>) -> Self
}

protocol _DecodingAttrable: _AnyElement, DecodingAttrable {}

extension DecodingAttrable {
    /// Indicates the preferred method to decode the image.
    ///
    /// Applicable to <img>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/decoding)
    @discardableResult
    public func decoding(_ value: DecodingType) -> Self {
        guard let s = self as? _DecodingAttrable else { return self }
        s.domElement.decoding = value.value.jsValue()
        return self
    }
    
    /// Indicates the preferred method to decode the image.
    ///
    /// Applicable to <img>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/decoding)
    @discardableResult
    public func decoding(_ value: State<DecodingType>) -> Self {
        value.listen { self.decoding($0) }
        return self
    }
    
    /// Indicates the preferred method to decode the image.
    ///
    /// Applicable to <img>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/decoding)
    @discardableResult
    public func decoding<V>(_ expressable: ExpressableState<V, DecodingType>) -> Self {
        decoding(expressable.unwrap())
    }
}

extension Img: _DecodingAttrable {}
