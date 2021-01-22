//
//  AutoplayAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AutoplayAttrable {
    @discardableResult
    func autoplay(_ value: Bool) -> Self
    @discardableResult
    func autoplay<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _AutoplayAttrable: _AnyElement, AutoplayAttrable {}

extension AutoplayAttrable {
    /// The audio or video should play as soon as possible.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autoplay)
    @discardableResult
    public func autoplay(_ value: Bool) -> Self {
        guard let s = self as? _AutoplayAttrable else { return self }
        s.domElement.autoplay = value.jsValue()
        return self
    }
    
    /// The audio or video should play as soon as possible.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autoplay)
    @discardableResult
    public func autoplay<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        autoplay(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autoplay($0) }
        return self
    }
}

extension Audio: _AutoplayAttrable {}
extension Video: _AutoplayAttrable {}
