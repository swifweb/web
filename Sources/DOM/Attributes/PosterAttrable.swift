//
//  PosterAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol PosterAttrable: DOMElement {
    @discardableResult
    func poster<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func poster<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension PosterAttrable {
    /// A URL indicating a poster frame to show until the user plays or seeks.
    ///
    /// Applicable to `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_poster.asp)
    @discardableResult
    public func poster<U: URLConformable>(_ value: U) -> Self {
        setAttribute("poster", value.stringValue)
        return self
    }
    
    /// A URL indicating a poster frame to show until the user plays or seeks.
    ///
    /// Applicable to `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_poster.asp)
    @discardableResult
    public func poster<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        poster(value.stateValue.wrappedValue)
        value.stateValue.listen { self.poster($0) }
        return self
    }
}

extension Video: PosterAttrable {}
