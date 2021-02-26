//
//  AutoplayAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AutoplayAttrable: DOMElement {
    @discardableResult
    func autoplay(_ value: Bool) -> Self
    @discardableResult
    func autoplay<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension AutoplayAttrable {
    /// The audio or video should play as soon as possible.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autoplay)
    @discardableResult
    public func autoplay(_ value: Bool) -> Self {
        setAttribute("autoplay", value, .short)
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

extension Audio: AutoplayAttrable {}
extension Video: AutoplayAttrable {}
