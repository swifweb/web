//
//  AcceptAttrable.swift
//  
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AcceptAttrable {
    @discardableResult
    func accept(_ value: [String]) -> Self
    @discardableResult
    func accept(_ value: String...) -> Self
    @discardableResult
    func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String]
}

protocol _AcceptAttrable: _AnyElement, AcceptAttrable {}

extension AcceptAttrable {
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    private func accept(value: String) -> Self {
        guard let s = self as? _AcceptAttrable else { return self }
        s.setAttribute("accept", value)
        return self
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept(_ value: [String]) -> Self {
        accept(value: value.joined(separator: ","))
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept(_ value: String...) -> Self {
        accept(value)
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        accept(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.accept(value: $0) }
        return self
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String] {
        accept(value.stateValue.wrappedValue)
        value.stateValue.listen { self.accept($0) }
        return self
    }
}

extension Form: _AcceptAttrable {}
extension InputFile: _AcceptAttrable {}
