//
//  LoadingAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol LoadingAttrable: DOMElement {
    @discardableResult
    func loading(_ value: LoadingType) -> Self
    @discardableResult
    func loading<S>(_ value: S) -> Self where S: StateConvertible, S.Value == LoadingType
}

extension LoadingAttrable {
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to `<img>`, `<iframe>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading(_ value: LoadingType) -> Self {
        setAttribute("loading", value.value)
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

extension Img: LoadingAttrable {}
extension IFrame: LoadingAttrable {}
