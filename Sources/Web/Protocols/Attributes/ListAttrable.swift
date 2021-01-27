//
//  ListAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ListAttrable {
    @discardableResult
    func list(_ value: String) -> Self
    @discardableResult
    func list(_ value: BaseElement) -> Self
    @discardableResult
    func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement
}

protocol _ListAttrable: _AnyElement, ListAttrable {}

extension ListAttrable {
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list(_ value: String) -> Self {
        guard let s = self as? _ListAttrable else { return self }
        s.setAttribute("list", value, wasmPlain: true)
        return self
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list(_ value: BaseElement) -> Self {
        list(value.uid)
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        list(value.stateValue.wrappedValue)
        value.stateValue.listen { self.list($0) }
        return self
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement {
        list(value.stateValue.wrappedValue)
        value.stateValue.listen { self.list($0) }
        return self
    }
}

extension Input: _ListAttrable {}
extension InputList: _ListAttrable {}
