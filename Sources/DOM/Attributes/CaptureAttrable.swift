//
//  CaptureAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol CaptureAttrable: DOMElement {
    @discardableResult
    func capture(_ value: CaptureType) -> Self
    @discardableResult
    func capture<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CaptureType
}

extension CaptureAttrable {
    /// The definition of 'media capture' in that specification.spec, specifies a new file can be captured.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/capture)
    @discardableResult
    public func capture(_ value: CaptureType) -> Self {
        setAttribute("capture", value.value)
        return self
    }
    
    /// The definition of 'media capture' in that specification.spec, specifies a new file can be captured.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/capture)
    @discardableResult
    public func capture<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CaptureType {
        capture(value.stateValue.wrappedValue)
        value.stateValue.listen { self.capture($0) }
        return self
    }
}

extension InputFile: CaptureAttrable {}
