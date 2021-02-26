//
//  DateTimeAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol DateTimeAttrable: DOMElement {
    @discardableResult
    func dateTime(_ value: String) -> Self
    @discardableResult
    func dateTime<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension DateTimeAttrable {
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to `<del>`, `<ins>`, `<time>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime(_ value: String) -> Self {
        setAttribute("datetime", value)
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

extension Del: DateTimeAttrable {}
extension Ins: DateTimeAttrable {}
extension Time: DateTimeAttrable {}
