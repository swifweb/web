//
//  CoordsAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol CoordsAttrable: DOMElement {
    @discardableResult
    func coords(_ value: [Int]) -> Self
    @discardableResult
    func coords(_ value: Int...) -> Self
    @discardableResult
    func coords<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Int]
}

extension CoordsAttrable {
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    private func coords(value: String) -> Self {
        setAttribute("coords", value)
        return self
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords(_ value: [Int]) -> Self {
        coords(value: value.map { "\($0)" }.joined(separator: ","))
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords(_ value: Int...) -> Self {
        coords(value)
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Int] {
        coords(value.stateValue.wrappedValue)
        value.stateValue.listen { self.coords($0) }
        return self
    }
}

extension Area: CoordsAttrable {}
