//
//  AutocapitalizeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AutocapitalizeAttrable {
    @discardableResult
    func autocapitalize(_ value: AutocapitalizeType) -> Self
    @discardableResult
    func autocapitalize<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocapitalizeType
}

protocol _AutocapitalizeAttrable: _AnyElement, AutocapitalizeAttrable {}

extension AutocapitalizeAttrable {
    /// Sets whether input is automatically capitalized when entered by user
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autocapitalize)
    @discardableResult
    public func autocapitalize(_ value: AutocapitalizeType) -> Self {
        guard let s = self as? _AutocapitalizeAttrable else { return self }
        s.domElement.autocapitalize = value.rawValue.jsValue()
        return self
    }
    
    /// Sets whether input is automatically capitalized when entered by user
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autocapitalize)
    @discardableResult
    public func autocapitalize<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocapitalizeType {
        autocapitalize(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autocapitalize($0) }
        return self
    }
}

extension BaseActiveElement: _AutocapitalizeAttrable {}
