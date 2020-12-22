//
//  CoordsAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol CoordsAttrable {
    @discardableResult
    func coords(_ value: [Int]) -> Self
    @discardableResult
    func coords(_ value: Int...) -> Self
    @discardableResult
    func coords(_ value: State<[Int]>) -> Self
    @discardableResult
    func coords<V>(_ expressable: ExpressableState<V, [Int]>) -> Self
}

protocol _CoordsAttrable: _AnyElement, CoordsAttrable {}

extension CoordsAttrable {
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to <area>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    private func coords(value: String) -> Self {
        guard let s = self as? _CoordsAttrable else { return self }
        s.domElement.coords = value.jsValue()
        return self
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to <area>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords(_ value: [Int]) -> Self {
        coords(value: value.map { "\($0)" }.joined(separator: ","))
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to <area>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords(_ value: Int...) -> Self {
        coords(value)
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to <area>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords(_ value: State<[Int]>) -> Self {
        value.listen { self.coords($0) }
        return self
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to <area>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords<V>(_ expressable: ExpressableState<V, [Int]>) -> Self {
        coords(expressable.unwrap())
    }
}

extension Area: _CoordsAttrable {}
