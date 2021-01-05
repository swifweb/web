//
//  ListAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ListAttrable {
    @discardableResult
    func list(_ value: String) -> Self
    @discardableResult
    func list(_ value: BaseElement) -> Self
    @discardableResult
    func list(_ value: State<String>) -> Self
    @discardableResult
    func list<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _ListAttrable: _AnyElement, ListAttrable {}

extension ListAttrable {
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list(_ value: String) -> Self {
        guard let s = self as? _ListAttrable else { return self }
        s.domElement.list = value.jsValue()
        return self
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list(_ value: BaseElement) -> Self {
        list(value.uid)
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list(_ value: State<String>) -> Self {
        value.listen { self.list($0) }
        return self
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list<V>(_ expressable: ExpressableState<V, String>) -> Self {
        list(expressable.unwrap())
    }
}

extension InputList: _ListAttrable {}
