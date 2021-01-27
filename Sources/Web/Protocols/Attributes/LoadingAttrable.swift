//
//  LoadingAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol LoadingAttrable {
    @discardableResult
    func loading(_ value: LoadingType) -> Self
    @discardableResult
    func loading<S>(_ value: S) -> Self where S: StateConvertible, S.Value == LoadingType
}

protocol _LoadingAttrable: _AnyElement, LoadingAttrable {}

extension LoadingAttrable {
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to `<img>`, `<iframe>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading(_ value: LoadingType) -> Self {
        guard let s = self as? _LoadingAttrable else { return self }
        s.setAttribute("loading", value.value)
        return self
    }
    
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to `<img>`, `<iframe>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading<S>(_ value: S) -> Self where S: StateConvertible, S.Value == LoadingType {
        loading(value.stateValue.wrappedValue)
        value.stateValue.listen { self.loading($0) }
        return self
    }
}

extension Img: _LoadingAttrable {}
extension IFrame: _LoadingAttrable {}
