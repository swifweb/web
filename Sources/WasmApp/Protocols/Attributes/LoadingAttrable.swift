//
//  LoadingAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LoadingAttrable {
    @discardableResult
    func loading(_ value: LoadingType) -> Self
    @discardableResult
    func loading(_ value: State<LoadingType>) -> Self
    @discardableResult
    func loading<V>(_ expressable: ExpressableState<V, LoadingType>) -> Self
}

protocol _LoadingAttrable: _AnyElement, LoadingAttrable {}

extension LoadingAttrable {
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to <img>, <iframe>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading(_ value: LoadingType) -> Self {
        guard let s = self as? _LoadingAttrable else { return self }
        s.domElement.loading = value.value.jsValue()
        return self
    }
    
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to <img>, <iframe>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading(_ value: State<LoadingType>) -> Self {
        value.listen { self.loading($0) }
        return self
    }
    
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to <img>, <iframe>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading<V>(_ expressable: ExpressableState<V, LoadingType>) -> Self {
        loading(expressable.unwrap())
    }
}

extension Img: _LoadingAttrable {}
extension IFrame: _LoadingAttrable {}
