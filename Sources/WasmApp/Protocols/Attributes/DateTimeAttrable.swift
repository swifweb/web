//
//  DateTimeAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DateTimeAttrable {
    @discardableResult
    func dateTime(_ value: String) -> Self
    @discardableResult
    func dateTime(_ value: State<String>) -> Self
    @discardableResult
    func dateTime<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _DateTimeAttrable: _AnyElement, DateTimeAttrable {}

extension DateTimeAttrable {
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to <del>, <ins>, <time>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime(_ value: String) -> Self {
        guard let s = self as? _DateTimeAttrable else { return self }
        s.domElement.datetime = value.jsValue()
        return self
    }
    
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to <del>, <ins>, <time>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime(_ value: State<String>) -> Self {
        value.listen { self.dateTime($0) }
        return self
    }
    
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to <del>, <ins>, <time>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime<V>(_ expressable: ExpressableState<V, String>) -> Self {
        dateTime(expressable.unwrap())
    }
}

extension Del: _DateTimeAttrable {}
extension Ins: _DateTimeAttrable {}
extension Time: _DateTimeAttrable {}
