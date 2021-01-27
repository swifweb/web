//
//  DateTimeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol DateTimeAttrable {
    @discardableResult
    func dateTime(_ value: String) -> Self
    @discardableResult
    func dateTime<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _DateTimeAttrable: _AnyElement, DateTimeAttrable {}

extension DateTimeAttrable {
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to `<del>`, `<ins>`, `<time>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime(_ value: String) -> Self {
        guard let s = self as? _DateTimeAttrable else { return self }
        s.setAttribute("datetime", value)
        return self
    }
    
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to `<del>`, `<ins>`, `<time>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        dateTime(value.stateValue.wrappedValue)
        value.stateValue.listen { self.dateTime($0) }
        return self
    }
}

extension Del: _DateTimeAttrable {}
extension Ins: _DateTimeAttrable {}
extension Time: _DateTimeAttrable {}
